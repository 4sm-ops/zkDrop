// use crate::Network;
// use snarkvm::prelude::{Address, PrivateKey, ViewKey};

use snarkvm_console::{account::{Address, PrivateKey, ViewKey}, network::Testnet3};

// use snarkvm::prelude::Testnet3;

// use anyhow::Result;
// use clap::Parser;
// use colored::*;
// use rand::SeedableRng;
// use rand_chacha::ChaChaRng;
// use std::convert::TryFrom;


// /// Commands to manage Aleo accounts.
// #[derive(Debug, Parser)]
// pub enum Account {
//     /// Generates a new Aleo account
//     New {
//         /// Seed the RNG with a numeric value
//         #[clap(short = 's', long)]
//         seed: Option<u64>,
//     },
// }

// impl Account {
//     pub fn parse(self) -> Result<String> {
//         match self {
//             Self::New { seed } => {
//                 // Sample a new Aleo account.
//                 let private_key = match seed {
//                     Some(seed) => PrivateKey::<Testnet3>::new(&mut ChaChaRng::seed_from_u64(seed))?,
//                     None => PrivateKey::new(&mut rand::thread_rng())?,
//                 };
//                 let view_key = ViewKey::try_from(&private_key)?;
//                 let address = Address::try_from(&view_key)?;

//                 // Print the new Aleo account.
//                 let output = format!(
//                     " {:>12}  {private_key}\n {:>12}  {view_key}\n {:>12}  {address}",
//                     "Private Key".cyan().bold(),
//                     "View Key".cyan().bold(),
//                     "Address".cyan().bold(),
//                 );

//                 Ok(output)
//             }
//         }
//     }
// }



fn main() {

    // let cli = Account::New { seed: None };

    // let cli = Account::New { seed: None };

    // let seed = None;

    let private_key = PrivateKey::<Testnet3>::new(&mut rand::thread_rng()).unwrap();

    let view_key = ViewKey::try_from(&private_key).unwrap();
    let address = Address::try_from(&private_key).unwrap();

    println!("{}", private_key.to_string());
    println!("{}", address.to_string());
    println!("{}", view_key.to_string());

    // // Print the new Aleo account.
    // let output = format!(
    //     " {:>12}  {private_key}\n {:>12}  {view_key}\n {:>12}  {address}",
    //     "Private Key".cyan().bold(),
    //     "View Key".cyan().bold(),
    //     "Address".cyan().bold(),
    // );

    // println!(output);
    // println!("Hello, world!");
}
