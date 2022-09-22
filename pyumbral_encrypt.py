# Usage:
# python3 pyumbral_generate_keys_from_aleo.py [SENDER_ACCOUNT_NAME] [RECIPIENT_ACCOUNT_NAME]

import os
import string
import time    

import hashlib
import random

from umbral import VerifiedKeyFrag, KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

from "lib/keys.py" import load_aleo_keys, restore_keys_from_aleo


# Aleo Encrypt Secret [String]

def pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, secret_text):

    sender_secret_key = sender_secret_key
    sender_public_key = sender_secret_key.public_key()

    sender_signing_key = sender_secret_key
    sender_verifying_key = sender_signing_key.public_key()
    sender_signer = Signer(sender_signing_key)

    # Encrypt with a public key
    # Now let’s encrypt data with Alice’s public key. Invocation of umbral.encrypt() returns both a capsule and a ciphertext. Note that anyone with Alice’s public key can perform this operation.

    plaintext = bytes(secret_text,'UTF-8')

    # encrypt with sender or recipient public key

    #capsule, ciphertext = encrypt(recipient_public_key, plaintext)
    capsule, ciphertext = encrypt(sender_public_key, plaintext)


    # Alice grants access to Bob by generating kfrags
    # When Alice wants to grant Bob access to view her encrypted data, 
    # she creates re-encryption key fragments, or “kfrags”, which are next sent to N proxies or Ursulas.

    kfrags = generate_kfrags(delegating_sk=sender_secret_key,
                            receiving_pk=recipient_public_key,
                            signer=sender_signer,
                            threshold=10,
                            shares=20)
    # print("kfrags output")
    # print(kfrags)

    # Save Ciphertext to file

    file = open("secret_sharing/ciphertext_from_{}_to_{}_{}".format(sender_profile_name, recipient_profile_name, int(time.time()) ), 'wb')
    file.write(ciphertext)
    file.close()

    # Save Capsule to file

    file = open("secret_sharing/capsule_from_{}_to_{}_{}".format(sender_profile_name, recipient_profile_name, int(time.time()) ), 'wb')

    file.write(bytes(capsule))
    file.close()

    # # Save kfrags to file

    with open("secret_sharing/kfrags_from_{}_to_{}_{}".format(sender_profile_name, recipient_profile_name, int(time.time()) ), 'wb') as fp:
        for item in kfrags:

            fp.write(bytes(item))

            # print(item.serialized_size())


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

# Encryption

pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, "Aleo + pyUmbral = Privacy")
