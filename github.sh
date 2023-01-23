#!/bin/bash

# This script automates the process of pushing and pulling files from GitHub

# Set the repository URL
repo_url="https://github.com/username/repository.git"

# Set the local directory to push/pull files from
local_directory="/path/to/local/directory"

# Set the branch name
branch_name="main"

# Initialize the local directory as a Git repository
cd $local_directory
git init

# Add the remote repository
git remote add origin $repo_url

# Pull the latest changes from the remote repository
git pull origin $branch_name

# Add all the files in the local directory to the repository
git add .

# Commit the changes
git commit -m "Automated commit"

# Push the changes to the remote repository
git push -u origin $branch_name

# Print a message to confirm the files have been pushed
echo "Files have been pushed to the remote repository"
