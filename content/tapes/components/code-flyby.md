```rust
#![no_std]
use soroban_sdk::{bytes, contract, contractimpl, panic_with_error, Address, Bytes, Env};
const HIGH_TTL: u32 = 3_110_399; // Our "upper bounds" is roughly 6 months (5 seconds per ledger)
const LOW_TTL: u32 = HIGH_TTL / 2; // Our "lower bounds" is roughly 3 months (5 seconds per ledger)

pub struct DataStoreContract;

#[contractimpl]
impl DataStoreContract {
    pub fn put(env: Env, user: Address, value: Bytes) -> Result<(), ContractError> {
        user.require_auth();
        if value.len() <= 10 {
            panic_with_error!(&env, ContractError::InputValueTooShort);
        }
        env.storage().temporary().set(&user, &value);
        env.storage()
           .temporary()
           .extend_ttl(&user, LOW_TTL, HIGH_TTL); // We are bumping the entry by `HIGH_TTL`.
        Ok(()) // return ok if function call succeeded
    }
    pub fn get(env: Env, owner: Address) -> Bytes {
        env.storage()
           .temporary()
           .get(&owner)
           .unwrap_or_else(|| bytes!(&env)) // This uses `unwrap_or_else` and closure which only evaluates Bytes(0) when necessary.
    }
}
```

