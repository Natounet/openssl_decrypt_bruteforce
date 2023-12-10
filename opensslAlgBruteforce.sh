#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <password> <input file>"
    exit 1
fi

PASSWORD=$1
INPUT_FILE=$2
DECRYPTED_FILE="decrypted_file"

# List of OpenSSL modes
MODES=(
    aes-128-cbc aes-128-ecb aes-192-cbc aes-192-ecb
    aes-256-cbc aes-256-ecb aria-128-cbc aria-128-cfb
    aria-128-cfb1 aria-128-cfb8 aria-128-ctr aria-128-ecb
    aria-128-ofb aria-192-cbc aria-192-cfb aria-192-cfb1
    aria-192-cfb8 aria-192-ctr aria-192-ecb aria-192-ofb
    aria-256-cbc aria-256-cfb aria-256-cfb1 aria-256-cfb8
    aria-256-ctr aria-256-ecb aria-256-ofb base64
    bf bf-cbc bf-cfb bf-ecb bf-ofb camellia-128-cbc
    camellia-128-ecb camellia-192-cbc camellia-192-ecb
    camellia-256-cbc camellia-256-ecb cast cast-cbc
    cast5-cbc cast5-cfb cast5-ecb cast5-ofb des des-cbc
    des-cfb des-ecb des-ede des-ede-cbc des-ede-cfb
    des-ede-ofb des-ede3 des-ede3-cbc des-ede3-cfb
    des-ede3-ofb des-ofb des3 desx rc2 rc2-40-cbc
    rc2-64-cbc rc2-cbc rc2-cfb rc2-ecb rc2-ofb rc4
    rc4-40 seed seed-cbc seed-cfb seed-ecb seed-ofb
    sm4-cbc sm4-cfb sm4-ctr sm4-ecb sm4-ofb
)

# Try to decrypt the file with each mode
for mode in "${MODES[@]}"; do
    echo "Trying $mode..."
    openssl enc -d -$mode -pass pass:$PASSWORD -in $INPUT_FILE -out $DECRYPTED_FILE 2> /dev/null

    if [ $? -eq 0 ]; then
        echo "Decryption successful with mode: $mode"
        exit 0
    fi
done

echo "Decryption failed with all modes."
exit 1
