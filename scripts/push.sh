#!/bin/bash

# This script will automate the git commands to add, commit. and push the material needed to push with the sign in information.

# Pull any new updates from github
git pull

# Get the comment for the commit
read -p 'What changes were made?: ' COMMENT

# Run the git command to add to the repository
git add .

# Run the git command to add and commit to the repository
git commit -m "${COMMENT}"

echo ""

# Get name for parent branch
read -p 'What is the name for the main branch?: ' BRANCH_NAME

echo ""

# Run the git command to push the changes
git push -u origin "${BRANCH_NAME}"
