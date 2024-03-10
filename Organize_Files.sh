#!/bin/bash

# Create directories for organizing files
declare -a directories=("Images" "Documents" "Videos" "Music" "Others")

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

# Organize files based on their extensions
for file in *; do
    if [ -f "$file" ]; then
        ext="${file##*.}"  # Get file extension
        ext_lower="$(echo "$ext" | tr '[:upper:]' '[:lower:]')"  # Convert extension to lowercase

        case "$ext_lower" in
            jpg|jpeg|png|gif)
                mv "$file" Images/
                echo "Moved $file to Images/"
                ;;
            doc|docx|pdf|txt)
                mv "$file" Documents/
                echo "Moved $file to Documents/"
                ;;
            mp4|mkv|avi|mov)
                mv "$file" Videos/
                echo "Moved $file to Videos/"
                ;;
            mp3|wav|flac)
                mv "$file" Music/
                echo "Moved $file to Music/"
                ;;
            *)
                mv "$file" Others/
                echo "Moved $file to Others/"
                ;;
        esac
    fi
done

echo "Automation complete!"


chmod +x organize_files.sh
