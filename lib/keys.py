import os
import string
import time

import hashlib

from umbral import VerifiedKeyFrag, KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

# Load JSON file with Aleo Keys

def load_aleo_keys(profileName):

    f = open("aleo_keys/aleo_{}_key.json".format(profileName))
    data = json.load(f)

    return data['AleoPrivateKey']


def load_aleo_address(profileName):

    f = open("aleo_keys/aleo_{}_key.json".format(profileName))
    data = json.load(f)

    return data['AleoAddress']

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

def pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, secret_text, data_md5_hash):

    sender_secret_key = sender_secret_key
    sender_public_key = sender_secret_key.public_key()

    sender_signing_key = sender_secret_key
    sender_verifying_key = sender_signing_key.public_key()
    sender_signer = Signer(sender_signing_key)

    # Encrypt with a public key
    # Now let’s encrypt data with Alice’s public key. Invocation of umbral.encrypt() returns both a capsule and a ciphertext. Note that anyone with Alice’s public key can perform this operation.

    plaintext = secret_text

#    plaintext = bytes(secret_text,'UTF-8')

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

    file = open("encrypted_files_tmp/ciphertext_{}".format(data_md5_hash) , 'wb')
    file.write(ciphertext)
    file.close()

    # Save Capsule to file

    file = open("encrypted_files_tmp/capsule_{}".format(data_md5_hash) , 'wb')

    file.write(bytes(capsule))
    file.close()

    # # Save kfrags to file

    with open("encrypted_files_tmp/kfrags_{}".format(data_md5_hash) , 'wb') as fp:
        for item in kfrags:

            fp.write(bytes(item))

            # print(item.serialized_size())

    return ciphertext



# Decrypt file

def pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file):

    # print("Received Ciphertext:")

    # Read the cyphertext file
    file = open("{}".format(encrypted_ciphertext), "rb")   # The "rb" clause tells the open method to read the file as bytes
    ciphertext = file.read()

    # print(ciphertext)

    # print("Received Capsule:")

    # Read the Capsule file
    file = open("{}".format(capsule_file), "rb")   # The "rb" clause tells the open method to read the file as bytes
    plaintext = file.read()

    capsule = Capsule._from_exact_bytes(plaintext)

    # print(capsule)

    # Read the kgrags file

    # print("Received kfrags:")

    received_kfrags = list()

    with open("{}".format(kfrags_file), "rb") as file:
        plaintext = file.read(260)

        while plaintext:

            kfrags = VerifiedKeyFrag.from_verified_bytes(plaintext) 
            plaintext = file.read(260)

            received_kfrags.append(kfrags)


    # print(received_kfrags)

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

    # print("Bob decrypted text:")
    return decrypted_cleartext