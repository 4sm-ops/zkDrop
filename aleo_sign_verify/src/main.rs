// Copyright (C) 2023 zkDrop.xyz
// This file is part of the zkDrop.xyz libraries.

// Input:
// arg[1] - action: sign, verify
// arg[2] - key: if sign -> PrivateKey, if verify -> Address
// arg[3] - message to sign/verify 
// arg[4] - signature (for verify only)

// Output:
// for sing: JSON with Message, Address and Signature 
// for verify: true or falce

// Example:
// Sign message: cargo run -- "sign" "APrivateKey1zkpEwiFtmMtKPfM8Mj8tteyVKvwZK3pVFwKZ91nGhHBgUTS" "Hello World"
// Verify message: cargo run -- "verify" "aleo1jn8pad7e58sa2r3w2743exv0s2fr7arsmdkrfgzq4d33ew2djvzshxgwqq" "Hello World" "sign1r63sd3fvwerkym5uq93dzxc4f48rxag7cjwf3sjf5eqvfuq4myqngwzqwd8kd9690eyuzx8065u06ul5hxzg52q2wt9saag55ax8kqmfna8xx8qlz5g4lsulg4wmuzu968r4cwxkq7800s7e7gwwhem9px5tpgc888g74eez75gaza4wfdclk8nhyrdmtuvjcegul7qw36fq5sy4thg"

// External packages:

use snarkvm_console::{account::{Address, PrivateKey, Signature}, network::Testnet3, prelude::*};

use snarkvm::prelude::test_crypto_rng;

use std::env;
use std::str;

use core::str::FromStr;

// Packages used for tests:

// use snarkvm_console_account::{Address, PrivateKey, ViewKey};
// use snarkvm_console_network::Testnet3;
// use snarkvm_utilities::rand::TestRng;
// use rand::Rng;


// Function to sign given message under Aleo Private Key
// Input: 
// priv_key - Aleo Private key
// message - Message string
// Output:
// JSON file with signed message, Aleo account Address, signature

fn aleo_sign_message(priv_key: &str, message: &str) {

    let rng = &mut test_crypto_rng();

    // Get Private Key from priv_key string
    let private_key = PrivateKey::<Testnet3>::from_str(priv_key).unwrap();

    // Get Address from Private Key
    let address = Address::try_from(&private_key).unwrap();

    // Sign message under Private Kye
    let result = private_key.sign_bytes(message.as_bytes(), rng);
    assert!(result.is_ok(), "Failed to generate a signature");

    // Get Signature
    let signature = result.unwrap();

    // Print JSON with sign results
    println!("{{ \"Message to Sign\": \"{}\", \"Aleo Address\": \"{}\", \"Signature\": \"{}\" }}", message, address.to_string(), signature.to_string());

}

// Function to verify given message/signature under Aleo Address
// Input: 
// address_key - Aleo Address
// message - Message string
// signature - Signature
// Output:
// true or false

fn aleo_verify_message(address_key: &str, message: &str, signature: &str) {

    // get Signature from string
    let sign_to_verify = Signature::<Testnet3>::from_str(&signature).unwrap();

    // get Address from string
    let address_to_verify = Address::from_str(&address_key).unwrap();

    // verify signature
    let result = sign_to_verify.verify_bytes(&address_to_verify, message.as_bytes());
    assert!(result, "Failed to execute signature verification");

    // print verification result
    println!("{}",result.to_string());
}

// Main function
// Sign or verify given message/signature

fn main() {

    // get input parameters
    let args: Vec<String> = env::args().collect();

    // input basic validation
    if args.len() < 3 {
        println!("Invalid number of arguments. Given: {} - Required: 3 for sign and 4 for verify", args.len() - 1);
        return;
    }

    // sign or verify given message/signature
    match args[1].as_str() {
        "sign" => {

            let aleo_key = &args[2];
            let message = &args[3];

            aleo_sign_message(aleo_key, message);

        },
        "verify" => {

            let aleo_key = &args[2];
            let message = &args[3];
            let signature_to_verify = &args[4];

            aleo_verify_message(aleo_key, message, signature_to_verify);
        },

        _ => panic!("Invalid input"),
    };

}
