#!/bin/bash

# This script will ask for a username and password for new user.




# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]

then
	echo "This script must be run as a superuser.  Try running as root?"
	exit 66
fi


# If the user does not supply at least one srgument, then give them help
if [[ "${#}" -lt 1 ]]

then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	exit 66

fi

# The first argument is the username
USER_NAME="${1}"

# The rest of the parameters are for the account comments
shift
COMMENT="${*}"

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]

then
	echo "The useradd command did not execute correctly."
	exit 66

fi

# Set the password.
PASSWORD=$(date +%s%N | sha256sum | head -c12)
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]

then
	echo "The passwd command did not execute correctly."
	exit 66

fi


# Force password change on first login.
passwd -e ${USER_NAME}

if [[ "${?}" -ne 0 ]]

then
	echo "Something went wrong."
	exit 66

fi


# Display the username, password, and the host name where the user was created.

echo ""
echo "Your username is ${USER_NAME}."
echo ""
echo "Your password is ${PASSWORD}."
echo ""
echo "The hostname of this computer is ${HOSTNAME}."
echo ""

