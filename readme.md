# OpenSSL Algorithm Bruteforcer

## Overview
This script is designed to automate the process of decrypting a file using various OpenSSL encryption modes. It tries to decrypt an input file using a specified password and iterates through a predefined list of OpenSSL modes until it successfully decrypts the file or exhausts all options.

## Requirements
- Bash shell (typically available on Unix-based systems)
- OpenSSL installed on your system

## Installation
1. Copy the script into a file, e.g., `decrypt_script.sh`.
2. Make the script executable:
   ```bash
   chmod +x decrypt_script.sh
   ```

## Usage
Run the script with the password and the input file as arguments:
```bash
./decrypt_script.sh [password] [input_file]
```
- `[password]`: The password used for decryption.
- `[input_file]`: The path to the encrypted file.

## Modes of Operation
The script includes a wide range of OpenSSL encryption modes, such as AES (various forms), ARIA, Blowfish, Camellia, CAST, DES, RC2, SEED, and SM4.

## Limitations & Warnings
- Ensure you have the right to decrypt the file.
- The script does not perform extensive error handling.
- The script stops as soon as it successfully decrypts the file with a mode.