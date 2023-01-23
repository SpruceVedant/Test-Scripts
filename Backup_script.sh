#!/bin/bash

# This script creates a backup of important files and directories

# Set the source and destination directories
source="/path/to/important/files"
destination="/path/to/backup/folder"

# Set the date and time format for the backup file
date=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup file with the date and time in the filename
tar -cvzf "$destination/backup_$date.tar.gz" $source

# Print a message to confirm the backup was created
echo "Backup created successfully at $destination/backup_$date.tar.gz"
