#!/bin/bash

# This script automates the process of downloading and extracting a file from a website

# Set the URL of the file to download
url="https://example.com/file.zip"

# Set the destination directory for the file
destination="/path/to/directory"

# Download the file
curl $url -P $destination

# Extract the file
unzip "$destination/file.zip" -d $destination

# Remove the zip file after extraction
rm "$destination/file.zip"

# Print a message to confirm the file has been downloaded and extracted
echo "File has been downloaded and extracted to $destination"
