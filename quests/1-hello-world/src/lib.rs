#![no_std]
use soroban_sdk::{contract, contractimpl, symbol_short, vec, Env, Symbol, Vec};

//<>QUEST
// //? Learn about your first Stellar smart contract!

//<>TASK
// //* Learn the function of the no_std tag

/// The `//![no_std]` attribute in Rust is used to indicate that the crate does not depend
/// on the standard library, resulting in a smaller binary size.  

//<>TASK
// //* Learn about the contract macro

/// The `//[contract]` attribute in Rust is used to mark a struct as a smart contract. When applied to a
/// struct, it indicates that the struct represents a smart contract and allows the Soroban SDK to
/// recognize and interact with it as a contract. This attribute is used to define the contract type and
/// provide necessary metadata for the contract implementation.

#[contract]
pub struct HelloContract;

//<>TASK
// //* Learn about the contract impl macro

/// The `//[contractimpl]` attribute macro in Rust is used to mark an implementation block as the
/// implementation for a specific contract type. In the context of smart contracts, it is used to define
/// the functions and behavior associated with a particular contract type. By using `//[contractimpl]`,
/// you are specifying that the functions within that implementation block are part of the contract
/// logic and will be attached to the contract type specified by the `//[contract]` attribute macro. This
/// helps organize and separate the contract logic from other parts of the codebase.

#[contractimpl]
impl HelloContract {
    //<>TASK
    // //* Learn about function declarations

    /// The `pub fn hello(env: Env, to: Symbol) -> Vec<Symbol>` function in the Rust code snippet is a
    /// public function named `hello` defined within the implementation block of the `HelloContract`
    /// smart contract.
    ///
    /// # Arguments
    ///
    /// * `env`: The [Env] provides access to information about the currently executing
    /// contract, who invoked it, contract data, functions for signing, hashing, etc.
    ///
    /// * `to`:
    ///
    /// returns: Vec<Symbol>
    ///
    /// # Examples
    ///
    /// ```
    ///
    /// ```
    pub fn hello(env: Env, to: Symbol) -> Vec<Symbol> {
        //<>TASK Learn about macro_rules
        /// The `vec![&env, symbol_short!("Hello"), to]` expression in the Rust code snippet is creating
        /// a vector containing references to the `Env` struct, a symbol created using the
        /// `symbol_short!` macro with the value "Hello", and the `to` parameter which is of type
        /// `Symbol`.
        vec![&env, symbol_short!("Hello"), to]
    }
}

//<>TASK
/// In Rust, `mod test;` is a declaration that creates a module named `test`. Modules in Rust are used
/// to organize code within a crate by grouping related functionality together. By declaring `mod
/// test;`, you are indicating that there is a module named `test` in the current scope. This module can
/// contain functions, structs, traits, and other items that are related to testing or any other purpose
/// you define.
mod test;
