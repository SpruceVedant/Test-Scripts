#!/bin/bash

# This script monitors a file for changes and takes action if it is modified

# Set the file to be monitored
file="/path/to/file"

# Set the interval for checking the file (in seconds)
interval=60

# Get the initial timestamp of the file
timestamp=$(stat -c %Y $file)

while true; do
  # Get the current timestamp of the file
  current_timestamp=$(stat -c %Y $file)

  # Check if the timestamp has changed
  if [ $timestamp != $current_timestamp ]; then
    # If the timestamp has changed, take action (e.g. send an email, run a script)
    echo "File $file has been modified." | mail -s "File Modified Alert" admin@example.com
    echo "File $file has been modified."
    # Update the timestamp to the current timestamp
    timestamp=$current_timestamp
  fi

  # Sleep for the specified interval before checking again
  sleep $interval
done
