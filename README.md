# Encrypt-Fox

Encrypt-Fox is a bash script that allows you to encrypt your Firefox profile using GPG (GNU Privacy Guard) and prompt for a password each time you want to use Firefox. This provides an extra layer of security for your browsing data.

**NOTE: This is pre-alpha quality software. Do not use it without expecting data loss. I am not responsible for any data loss or damage caused by using this script. I made it for myself since I wanted this functionality and made it with the help of Claude 3 Opus, but I will be adding features and updating it myself**

## Prerequisites

Before using Encrypt-Fox, ensure that you have the following dependencies installed on your system:

- GPG (GNU Privacy Guard)
- tar

## Installation

1. Clone the Encrypt-Fox repository or download the `encrypt-fox.sh` script.

2. Make the script executable by running the following command:

   ```bash
   chmod +x encrypt-fox.sh

3. Done, now run it with `./encrypt-fox.sh` (note: it assumes you have a profile under `81xk3qby.encrypted` please change this if needed)
