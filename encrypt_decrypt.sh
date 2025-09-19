#!/bin/bash

# Automated File Encryption & Decryption Script
# Supports OpenSSL (AES-256) and GPG (Password & Key-based)

encrypt_with_openssl() {
    echo "Encrypting with OpenSSL..."
    openssl enc -aes-256-cbc -salt -in "$1" -out "$1.enc" -pass pass:"$2"
    echo "File encrypted: $1.enc"
}

decrypt_with_openssl() {
    echo "Decrypting with OpenSSL..."
    openssl enc -aes-256-cbc -d -in "$1" -out "${1%.enc}" -pass pass:"$2"
    echo "File decrypted: ${1%.enc}"
}

encrypt_with_gpg() {
    echo "Encrypting with GPG..."
    gpg --symmetric --cipher-algo AES256 --output "$1.gpg" "$1"
    echo "File encrypted: $1.gpg"
}

decrypt_with_gpg() {
    echo "Decrypting with GPG..."
    gpg --output "${1%.gpg}" --decrypt "$1"
    echo "File decrypted: ${1%.gpg}"
}

encrypt_with_gpg_key() {
    echo "Encrypting with GPG Key..."
    gpg --recipient "$2" --encrypt "$1"
    echo "File encrypted: $1.gpg"
}

decrypt_with_gpg_key() {
    echo "Decrypting with GPG Key..."
    gpg --output "${1%.gpg}" --decrypt "$1"
    echo "File decrypted: ${1%.gpg}"
}

echo "Select an option:"
echo "1) Encrypt with OpenSSL (Password)"
echo "2) Decrypt with OpenSSL (Password)"
echo "3) Encrypt with GPG (Password)"
echo "4) Decrypt with GPG (Password)"
echo "5) Encrypt with GPG (Key-based)"
echo "6) Decrypt with GPG (Key-based)"
read -p "Enter choice [1-6]: " choice

if [[ "$choice" == "1" ]]; then
    read -p "Enter file name to encrypt: " file
    read -sp "Enter password: " password
    echo
    encrypt_with_openssl "$file" "$password"

elif [[ "$choice" == "2" ]]; then
    read -p "Enter encrypted file name (.enc): " file
    read -sp "Enter password: " password
    echo
    decrypt_with_openssl "$file" "$password"

elif [[ "$choice" == "3" ]]; then
    read -p "Enter file name to encrypt: " file
    encrypt_with_gpg "$file"

elif [[ "$choice" == "4" ]]; then
    read -p "Enter encrypted file name (.gpg): " file
    decrypt_with_gpg "$file"

elif [[ "$choice" == "5" ]]; then
    read -p "Enter file name to encrypt: " file
    read -p "Enter recipient GPG key name: " key
    encrypt_with_gpg_key "$file" "$key"

elif [[ "$choice" == "6" ]]; then
    read -p "Enter encrypted file name (.gpg): " file
    decrypt_with_gpg_key "$file"

else
    echo "Invalid option!"
fi
