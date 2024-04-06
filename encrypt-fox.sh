#!/bin/sh

# Check if GPG is installed
if ! command -v gpg &> /dev/null; then
  echo "Error: GPG is not installed. Please install GPG and try again."
  exit 1
fi

# Check if tar is installed
if ! command -v tar &> /dev/null; then
  echo "Error: tar is not installed. Please install tar and try again."
  exit 1
fi

firefox_profile_dir="$HOME/.mozilla/firefox/81xk3qby.encrypted"
encrypted_profile_dir="$HOME/.mozilla_encrypted/firefox/81xk3qby.encrypted"
encrypted_file="$encrypted_profile_dir/encrypted.tar.gz.gpg"

# Function to encrypt the Firefox profile
encrypt_profile() {
  echo "Encrypting Firefox profile..."
  tar -czf - -C "$firefox_profile_dir" . | gpg --batch --yes --passphrase "$encryption_password" --symmetric --output "$encrypted_file"
  rm -rf "$firefox_profile_dir"/*
}

# Function to decrypt the Firefox profile
decrypt_profile() {
  echo "Decrypting Firefox profile..."
  gpg --batch --yes --passphrase "$encryption_password" --decrypt "$encrypted_file" | tar -xz -C "$firefox_profile_dir"
}

# Check if the encrypted profile exists
if [ -f "$encrypted_file" ]; then
  # Prompt for the decryption password
  read -s -p "Enter the decryption password: " encryption_password
  echo
  
  # Decrypt the profile
  decrypt_profile
else
  # Create the necessary directories if they don't exist
  mkdir -p "$firefox_profile_dir"
  mkdir -p "$encrypted_profile_dir"
  
  # Prompt for the encryption password
  read -s -p "Enter the encryption password: " encryption_password
  echo
  
  # Encrypt the profile with the provided password
  encrypt_profile
fi

# Open Firefox with the decrypted profile
firefox -profile "$firefox_profile_dir" &

# Wait for Firefox to close
firefox_pid=$!
wait $firefox_pid

# Encrypt the profile after Firefox closes
encrypt_profile
