#!/bin/bash

# This script checks the available disk space on a server

# Set the threshold for minimum available space (in GB)
threshold=5

# Get the available space on the server (in GB)
space=$(df -BG / | awk 'FNR == 2 {print $4}')

# Compare the available space to the threshold
if (( $(echo "$space < $threshold" | bc -l) )); then
  # If the available space is less than the threshold, send an email alert
  echo "Low disk space on server. Available space: $space GB." | mail -s "Low Disk Space Alert" admin@example.com
else
  # If the available space is greater than or equal to the threshold, print a message
  echo "Available disk space: $space GB. No action needed."
fi
