# Usage:
# python3 pyumbral_generate_keys_from_aleo.py [ACCOUNT_NAME]

import os
import string
import time    

import hashlib
import random

from umbral import VerifiedKeyFrag, KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

from lib.keys import load_aleo_keys, restore_keys_from_aleo


# Decrypt file

def pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file):

    print("Received Ciphertext:")

    # Read the cyphertext file
    file = open("{}".format(encrypted_ciphertext), "rb")   # The "rb" clause tells the open method to read the file as bytes
    ciphertext = file.read()

    print(ciphertext)

    print("Received Capsule:")

    # Read the Capsule file
    file = open("{}".format(capsule_file), "rb")   # The "rb" clause tells the open method to read the file as bytes
    plaintext = file.read()

    capsule = Capsule._from_exact_bytes(plaintext)

    print(capsule)

    # Read the kgrags file

    print("Received kfrags:")

    received_kfrags = list()

    with open("{}".format(kfrags_file), "rb") as file:
        plaintext = file.read(260)

        while plaintext:

            kfrags = VerifiedKeyFrag.from_verified_bytes(plaintext) 
            plaintext = file.read(260)

            received_kfrags.append(kfrags)


    print(received_kfrags)

    # recepient Public key

    recipient_public_key = recipient_secret_key.public_key()

    # # Bob receives a capsule
    # # Next, let’s generate a key pair for Bob, and pretend to send him the capsule 
    # # through a side channel like S3, IPFS, Google Cloud, Sneakernet, etc.

    bobs_capsule = capsule

    # Ursulas perform re-encryption
    # Bob asks several Ursulas to re-encrypt the capsule so he can open it. 
    # Each Ursula performs re-encryption on the capsule using the kfrag provided by Alice, obtaining this way a “capsule fragment”, or cfrag. 

    cfrags = list()                 # Bob's cfrag collection   cfrag = capsule fragment
    for kfrag in received_kfrags:
        cfrag = reencrypt(capsule=bobs_capsule, kfrag=kfrag)
        cfrags.append(cfrag)        # Bob collects a cfrag

    # Decryption
    # Bob checks the capsule fragments
    # If Bob received the capsule fragments in serialized form, he can verify that 
    # they are valid and really originate from Alice, using Alice’s public keys.

    suspicious_cfrags = [CapsuleFrag.from_bytes(bytes(cfrag)) for cfrag in cfrags]
    cfrags = [cfrag.verify(bobs_capsule, verifying_pk=sender_public_key,
                       delegating_pk=sender_public_key,
                           receiving_pk=recipient_public_key,
                           )
              for cfrag in suspicious_cfrags]
    
    # # Bob opens the capsule
    # # Finally, Bob decrypts the re-encrypted ciphertext using his key.

    decrypted_cleartext = decrypt_reencrypted(receiving_sk=recipient_secret_key,
                                    delegating_pk=sender_public_key,
                                    capsule=bobs_capsule,
                                    verified_cfrags=cfrags,
                                    ciphertext=ciphertext)

    # Verify decryption result

    print("Bob decrypted text:")
    print(decrypted_cleartext)

# MAIN #

# Get Sender Profile name and keys

sender_profile_name = sys.argv[1]
aleo_private_key = load_aleo_keys(sys.argv[1])
sender_secret_key = restore_keys_from_aleo(aleo_private_key)
sender_public_key = sender_secret_key.public_key()

# Get Recipient Profile name and keys

recipient_profile_name = sys.argv[2]
aleo_private_key = load_aleo_keys(sys.argv[2])
recipient_secret_key = restore_keys_from_aleo(aleo_private_key)
recipient_public_key = recipient_secret_key.public_key()

# Get ciphertext, capsule and kfrags files

encrypted_ciphertext = sys.argv[3]
capsule_file = sys.argv[4]
kfrags_file = sys.argv[5]

# Decryption

pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file)

