#!/bin/bash

# Define directory and extension
directory="/path/to/directory"
extension=".txt"
counter=1

# Loop through files with the extension
for filename in "$directory"/*"$extension"; do
  # Generate new filename with counter
  new_filename="file_$counter$extension"
  
  # Rename the file
  mv "$filename" "$directory/$new_filename"
  
  # Increment counter
  counter=$((counter + 1))
done

echo "Files renamed successfully in $directory"
