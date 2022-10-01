# zkDrop - Digital ID and secure file sharing concept based on Aleo zk features

## Backlog:

https://mercurial-origami-04e.notion.site/a6536fb7ac2642c1834b4c57a3d0ee63?v=ac231823e34b4622b17569a7f6629c58

## Repo structure:

#### Scripts: 
aleo_create_account.sh - Create Aleo keys and store it in `aleo_keys` folder in JSON format 
pyumbral_decrypt.py - Decrypt file using pyUmbral
pyumbral_encrypt.py - Encrypt file using pyUmbral
pyumbral_network_encryption.py - Encryption

#### Tools:
aleo_sign_verify - Aleo sign/verify tool written in Rust

#### Folders:
aleo_keys - Aleo keys in JSON files
aleo_pyumbral_keys - temp file for pyUmbral
assets - assets folder
lib - python libs
secret_sharing - pyUmbral file

#### GUI:
zkDrop.py - gui zkDrop application

# Description

Aleo based tool for file sharing and collaboration between addresses. Private, easy-to-use, and on-chain. Store, encrypt, and share multimedia files on-chain.

# Use cases

## Use case #1 (User-2-user)

1. Alex wants to share his files with Bob
2. Alex takes Bob’s Aleo Account (Public key or QR code)
3. Alex adds his file to application
4. Application encrypts it and securely transfer to Bob

## Use case #2 (Corp)

1. Ms Liza wanted to open a bank account and she contacted one of the bank representatives Mr Vendy.
2. Mr Vendy – after asking some basic details from Liza such as name, occupation etc advised her to obtain a digital ID for KYC purpose and asked her to use zkDrop.xyz
3. Liza follows all the steps mentioned in [zkDrop.xyz](http://zkDrop.xyz) application.
4. Finally she manages to get her Aleo Identity (public and private keys) .
5. She shares the public key with Mr Vendy and proceeds with other formalities.

This is issued on a 1-to-1 basis unique to the customer only, and it cannot be a shared identity with other users. Any business that needs a customer’s information must request it in order to get  approval.

KYC (Know Your Customer), AML (Anti-Money Laundering) and CFT (Counter-Financing Terrorism)

# Data management

## File/Data encryption

![File/Data encryption](https://raw.githubusercontent.com/4sm-ops/zkDrop/main/assets/zkdrop-file-data-encryption.png)

## Secure zero-knowledge file storage

The customer’s data profile is stored locally in an encrypted format on their own device, and this can be shared in future for KYC requirements.

The Key principle of Secure Data Storage is encryption of Data Storage using data encryption keys. Encryption keys are stored on user’s device and protected by (Password and OTP/biometrics). In case of device loss recovery mechanism would be provided to regenerate the encryption key however this will be covered in the next phase of the project.

![Secure zero-knowledge file storage](https://raw.githubusercontent.com/4sm-ops/zkDrop/main/assets/zkdrop-file-storage.png)

## Secure zero-knowledge file transmission

In all cases, the PRE Application must be integrated with a storage and transport layer in order to function properly. Along with the transport of ciphertexts, a nucypher application also needs to include channels for Alice and Bob to discover each other’s public keys, and provide policy encrypting information to Bob and Enrico.

Every data field is  encrypted at rest with zero knowledge of its contents while the customer is the only one who can access it.

Other businesses who need to request personal data will also have to get the consent of the customer first.

Using Umbral, Alice (the data owner) can delegate decryption rights to Bob for any ciphertext intended to her, through a re-encryption process performed by a set of semi-trusted proxies or Ursulas. When a threshold of these proxies participate by performing re-encryption, Bob is able to combine these independent re-encryptions and decrypt the original message using his private key.

Invocation of **[umbral.encrypt()](https://pyumbral.readthedocs.io/en/latest/api.html#umbral.encrypt)** returns both a capsule and a ciphertext. Note that anyone with Alice’s public key can perform this operation.

Since data was encrypted with Alice’s public key, Alice can open the capsule and decrypt the ciphertext with her private key.

When Alice wants to grant Bob access to view her encrypted data, she creates *re-encryption key fragments*, or *“kfrags”*, which are next sent to N proxies or *Ursulas*.

Alice must specify shares (the total number of kfrags), and a threshold (the minimum number of kfrags needed to activate a capsule). In the following example, Alice creates 20 kfrags, but Bob needs to get only 10 re-encryptions to activate the capsule.

If Bob attempts to open a capsule that was not encrypted for his public key, or re-encrypted for him by Ursula, he will not be able to open it.

If Bob received the capsule fragments in serialized form, he can verify that they are valid and really originate from Alice, using Alice’s public keys.

Finally, Bob decrypts the re-encrypted ciphertext using his key.

![Secure zero-knowledge file transmission](https://raw.githubusercontent.com/4sm-ops/zkDrop/main/assets/zkdrop-secure-zk-file-transmission.png)


# Aleo Keys

![Aleo Keys](https://raw.githubusercontent.com/4sm-ops/zkDrop/main/assets/zkdrop-aloe-keys.png)

## Key generation

### Aleo account // Shielded identity

An Aleo account is composed of an account **private key**, account **view key**, and an ****account **address**.

The account private key is used to authorize a transaction, which updates the global state of account records. The account view key is used to decrypt account records, which are encrypted under the user's account address. Lastly, the account address enables users to interact with one another, sending and receiving records that encode values and application data.

```
{
  "AccountName": "RustamOne",
  "AleoPrivateKey": "APrivateKey1zkpEwiFtmMtKPfM8Mj8tteyVKvwZK3pVFwKZ91nGhHBgUTS",
  "AleoViewKey": "AViewKey1iLBkmV1JhxBLYJVTusWsfiFn46VhSNyB1WCjeLtNFbaX",
  "AleoAddress": "aleo1jn8pad7e58sa2r3w2743exv0s2fr7arsmdkrfgzq4d33ew2djvzshxgwqq"
}
```

Materials:

1. https://docs.nucypher.com/en/latest/application_development/getting_started.html
2. https://mercurial-origami-04e.notion.site/a6536fb7ac2642c1834b4c57a3d0ee63?v=ac231823e34b4622b17569a7f6629c58
3. 
