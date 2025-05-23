# Quest 2 - Auth Store <!-- omit in toc -->

## TL;DR

Do you consider yourself "advanced"? Do you think you can skip the high-level
theory and get away with rushing into this quest? Do you feel comfortable
completely mucking up your account before you even understand the assignment?

**In this quest, you will deploy the quest 2 Auth Store contract to the Stellar
Testnet. Then you must successfully invoke the `put` function to store some data
on the ledger, and then successfully invoke the `get` function to retrieve that
same data.**

## Table of Contents <!-- omit in toc -->

- [TL;DR](#tldr)
- [How to Play](#how-to-play)
- [The Task at Hand](#the-task-at-hand)
    - [Explore the Contract Code](#explore-the-contract-code)
    - [State Archival and Storage Types](#state-archival-and-storage-types)
        - [Temporary Storage](#temporary-storage)
        - [Persistent Storage](#persistent-storage)
        - [Instance Storage](#instance-storage)
    - [Storing Data](#storing-data)
    - [Retrieving Data](#retrieving-data)
    - [Extending TTLs](#extending-ttls)
    - [Simple Authentication](#simple-authentication)
- [Further Reading](#further-reading)
- [Still Stuck?](#still-stuck)

## How to Play

If you missed out on our previous quest, or you just need a refresher, we have
some (pretty extensive) instructions for the _mechanics_ of completing these
quests (generating keypairs, checking your work, etc.).

All that information [can be found here][how-to-play] if you need to use those
instructions again.

## The Task at Hand

So, down to brass tacks! Let's figure out how this quest works. A Soroban
contract can store arbitrary data in the ledger, and this data can then be
retrieved at a later time or in different contexts. Your job today is to both
store, and subsequently retrieve data by invoking a pair of functions in your
contract. (After it's been deployed to the Testnet, of course!)

### Explore the Contract Code

Just like all the quests, this quest's [`lib.rs`](src/lib.rs) and
[`test.rs`](src/test.rs) files are commented with handy documentation and
explanations of what is happening. Be sure to check them out and read through
what the contract is up to.

**Important**: This quest has pretty complete comments and documentation
(particularly in the tests) in those two files. It will go **miles** to help
your understanding of Soroban, if you read through those files, and take the
time to understand what's happening.

### Build the Contract

_The build process will compile our Rust code into a binary that is
purpose-built for the WebAssembly environment that Soroban will provide for it._

```bash
# change into the quest directory
cd quests/2-auth-store
# build the contract
stellar contract build --package soroban-auth-store-contract
```

### State Archival and Storage Types

Do you know what is _incredibly unique_ and _amazingly powerful_ about Soroban?
The answer might surprise you: [**State Archival**][state-archival]. A
real-world problem within the blockchain space is that of "ledger bloat" (i.e.,
the indefinite storage of enormous amounts of data that are supposed to live on
the blockchain "forever.") Simply put, there is no reasonable way for users or
developers to make a **one-time** payment, and have their data live on the
blockchain until the sun burns out. Whether you think about it from an economic
standpoint, through a sustainability lens, or just are concerned about making
the network operate in a healthy manner: there _has_ to be some mechanism to
"archive" stale entries on the blockchain.

Soroban is tackling this problem head-on with it's novel system of "rent" for
ledger entries. Each ledger entry gets to live on the blockchain as long as it
has paid a sufficient rent balance. Even if it does run out of rent, the
persistent data entry can be restored! This means the ledger data acts _as if_
it is stored in the ledger forever, without requiring nearly as much long-term
overhead to keep the network operating. Of course, if you don't want your ledger
entries to be archived, you can extend the time to live (TTL) of that entry at
any time to keep the rent paid up.

Soroban has three types of Storage: `Temporary`, `Persistent`, and `Instance`.

#### Temporary Storage

- This is the cheapest of all storage types.
- An unlimited amount of temporary storage is available to each contract.
- It's designed for data that may only need to exist for a limited time. (e.g.,
  price oracles, signatures, etc.)
- The default "lifetime" for temporary storage is **16 ledgers** (with an
  estimated 5 seconds per ledger, that lifetime is roughly 80 seconds).
- The entry will become "dead" once the lifetime ends (unless the entry's TTL
  has been extended). Once dead, the the ledger entry is **permanently**
  deleted.
- Later on, the entry _can_ be re-created, but it _cannot_ be restored.

#### Persistent Storage

- This is the most expensive storage type (same price as `Instance` storage).
- An unlimited amount of persistent storage is available to each contract.
- It's designed for data that is unique among each contract user, and is not
  suitable to store temporarily. (e.g., user balances)
- The default "lifetime" for persistent storage is **120,960 ledgers** (with an
  estimated 5 seconds per ledger, that lifetime is roughly 14 days)
- The entry will be archived once the lifetime ends (unless the entry's TTL has
  been extended). Once archived (which can happen while the contract instance is
  still active), the ledger is moved to the "Inactive State Store" (ISS) and the
  entry becomes inaccessible to the network.
- Later on, the entry _cannot_ be re-created, but it _can_ be restored (this
  prevents over-writing a restorable ledger entry with different data).

#### Instance Storage

> _Note:_ Instance Storage uses `Persistent` storage under the hood. Everything
> is essentially the same, and the difference between the two is more of an
> abstraction to identify shared state vs. user-specific state.

- This is the most expensive storage type (same price as `Persistent` storage).
- A limited amount of instance storage is available to each contract.
- It's designed for "global" data that is common and shared across all
  invocations of the contract. (e.g., admin accounts, contract metadata, etc.)
- Shares the "lifetime" of the contract instance. If the contract instance is
  still active, the instance storage data is guaranteed to be active. (Contract
  instances use the same default "lifetime" as `Persistent`).
- The entry will be archived only if the contract instance becomes inactive
  (unless the entry's TTL has been extended). Once the contract instance is
  inactive, the instance storage inactivates alongside it, and both are moved to
  the "Inactive State Store" (ISS) and become inaccessible to the network.
- Later on, the contract instance _cannot_ be re-created, but it _can_ be
  restored (this prevents over-writing a restorable contract with different
  data). If a contract is restored, its instance storage is restored as well.

### Storing Data

Soroban uses the `Env.storage().<storage_type>().set()` function (where
`<storage_type>` is one of `temporary`, `persistent`, or `instance`) to store
data in a contract's ledger entries. As a general rule, `Temporary` storage
should only be used for data that can be easily recreated or is only valid for a
period of time, where `Persistent` or `Instance` storage should be used for data
that can not be recreated and should kept permanently, such as a user's token
balance.

You can think of these ledger entries as key-value storage that can only be
accessed through the contract that owns it. You can construct a contract's
ledger entries in many different ways. They could be made up of very simple
elements like a symbol or number. Or, they can also be made from very complex
vectors or maps.

The `temporary` ledger entries for this quest will store a supplied `value`
alongside an `Address`. Using Soroban's `Address::require_auth()` function gives
us a simple method of authenticating a user. Only someone who could successfully
sign for an address is permitted to store data in this contract associated with
that address.

_Invoke the contract's `put` function to store some data into the contract's
ledger entry for your quest account._

### Retrieving Data

To retrieve data from within a contract's ledger entries, the
`Env.storage().<storage_type>().get()` function (where `<storage_type>` is one
of `temporary`, `persistent`, or `instance`) is available to us. When called
with a `key` that corresponds to data the contract has previously stored, we get
the `value` stored alongside it in return.

The contract's `get` function will retrieve stored data associated with any
address. When supplied with an `Address` as an argument, this function will
search for stored data corresponding to that address.

_Invoke the contract's `get` function to retrieve contract data associated with
your quest account._

### Extending TTLs

For every storage entry, there is the potential to extend the entry's lifetime
until some time further in the future. The Stellar network has lifetime values
for storage types that are configurable (by means of a validator vote). The
current set of values for these lifetime settings are listed in the following
table. The values are listed in "number of ledgers" and a typical ledger will
settle in an estimated 5 seconds.

| Storage Type | Minimum Lifetime   | Maximum Lifetime      | Default Lifetime   |
|--------------|--------------------|-----------------------|--------------------|
| Temporary    | 16 (~80 seconds)   | 3,110,400 (~6 months) | 16 (~80 seconds)   |
| Persistent   | 120,960 (~14 days) | 3,110,400 (~6 months) | 120,960 (~14 days) |
| Instance     | 120,960 (~14 days) | 3,110,400 (~6 months) | 120,960 (~14 days) |

Because the `temporary` storage type has such a short default lifetime, our
contract code immediately extends the TTL of the entry to the maximum lifetime
when it is created. This is one technique to extend ledger entry lifetimes, but
certainly not the only method. You can also utilize a
[`ExtendFootprintTTLOp`][extend-ttl] operation inside a Stellar transaction to
accomplish the same thing. The `stellar` CLI also has a command to help
facilitate these TTL extension transactions.

```bash
stellar contract extend \
    --id  CARCWZOD26AJQ42VRJ3UYC3MJNGJV5UHO4VFHV5FWLVIKDCJ4CZOJXII \
    --key KeySymbol \
    --durability temporary \
    --ledgers-to-extend 100
```

When you specify a new lifetime when bumping a ledger entry, it ensures that the
expiration is _at least_ that many ledgers in the future (from the time of
invocation). For example, if a ledger entry is extended by 100 ledgers and the
current lifetime is 50, the lifetime will be extended to 100. If a ledger entry
is extended by 100 ledgers and the current lifetime is 150, the lifetime will
not be extended.

### Simple Authentication

OK, so what's the point of all this? Sure, it's pretty neat to be able to store
and retrieve data from the smart contract network. But, is there anything
more... "useful" about this?!

Well, sure! For starters, you can control _who_ is allowed to set _which_ of the
contract's data keys. The way we've coded this contract, **only** an invocation
with a valid authorization can store or modify data associated with a given
Address. The `Address::require_auth()` function can be a very powerful
authentication method that can be made both quite simple and quite complex.

## Further Reading

- Check out the [storing data][data-example] example contract for some further
  discussion about this method of storing and retrieving data.
- A discussion of more advanced authentication methods can be found in the
  [auth][auth-example] how-to guide.
- You can learn more about [persisting data][persist-data] in the Soroban
  documentation.

## Still Stuck?

If you're hitting a brick wall, and you're not sure what your next move is,
check out [this section](../../README.md#feeling-lost) in our main README. It's
got a couple of suggestions for where you might go from here.

[how-to-play]: ../1-hello-world/bossfight-1.md#how-to-play

[data-example]: https://developers.stellar.org/docs/build/smart-contracts/getting-started/storing-data

[auth-example]: https://developers.stellar.org/docs/build/smart-contracts/example-contracts/auth

[persist-data]: https://developers.stellar.org/docs/learn/encyclopedia/storage/persisting-data

[state-archival]: https://developers.stellar.org/docs/learn/encyclopedia/storage/state-archival

[extend-ttl]: https://developers.stellar.org/docs/build/guides/cli/extend-contract-storage