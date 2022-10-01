import os
import string
import time

import hashlib

from umbral import KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

# Load JSON file with Aleo Keys

def load_aleo_keys(profileName):

    f = open("aleo_keys/aleo_{}_key.json".format(profileName))
    data = json.load(f)

    return data['AleoPrivateKey']

# Aleo Private Key -> Umbral SecretKey PoC function

def restore_keys_from_aleo(aleoPrivateKey):
    
    # Calculate sha256 hash from sample Aleo Private Key
    # snarkos experimental new_account
    aleo_private_key_hash = hashlib.sha256()

    # aleo_private_key_hash.update(b"{}".format(aleoPrivateKey))
    aleo_private_key_hash.update(bytes(aleoPrivateKey,'UTF-8'))    

    # We use .from_bytes function to read new SecretKey from sha256() output
    # .from_bytes function expects 32 bytes
    # that's why we cannot use Aleo Private Key itself (which is 59 bytes long)

    sk = SecretKey.from_bytes(aleo_private_key_hash.digest())

    # print(sk.to_secret_bytes())
    # print(sk.serialized_size())
    
    # Generating public key from SecretKey
    pk_from_sk = sk.public_key()

    # Validation of data types
    
    assert type(sk) == SecretKey
    assert type(pk_from_sk) == PublicKey

    return sk


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

    return ciphertext