#!/bin/bash

# This script creates an account on the loacl system.
# You will be prompted for the account name and password

# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# Ask for the real name.
read -p 'Enter the name of the person who this account is for: ' REAL_NAME

# Ask for the password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user.
useradd -c "${REAL_NAME}" -m ${USER_NAME}
# Set the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force the password change on first login.
passwd -e ${USER_NAME}

