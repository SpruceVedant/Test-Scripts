#!/bin/bash

# Log file location
LOG_FILE="$HOME/time_tracker.log"

# Function to get a description
function get_description {
  read -p "Enter a short description for this task: " desc
  echo "$desc"
}

# Function to start tracking time
function start_track {
  start_time=$(date +%s)
  echo "Started tracking at: $(date)" >> "$LOG_FILE"
  get_description >> "$LOG_FILE"
}

# Function to stop tracking time
function stop_track {
  end_time=$(date +%s)
  duration=$((end_time - start_time))
  echo "Stopped tracking at: $(date)" >> "$LOG_FILE"
  echo "Duration: $((duration / 60)) minutes, $((duration % 60)) seconds" >> "$LOG_FILE"
  echo "" >> "$LOG_FILE"
}

# Main script execution
while true; do
  echo "Time Tracker Menu:"
  echo "1. Start tracking time"
  echo "2. Stop tracking time"
  echo "3. Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1)
      start_track
      ;;
    2)
      if [[ ! -f "$LOG_FILE" ]]; then
        echo "No time tracked yet!"
      else
        stop_track
      fi
      ;;
    3)
      exit 0
      ;;
    *)
      echo "Invalid choice!"
      ;;
  esac
done
