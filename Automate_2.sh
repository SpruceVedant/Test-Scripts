#!/bin/bash

# Define task1 function
task1() {
  # rename all jpeg files in the current directory to have a .jpg extension
  for file in *.jpeg; do
    mv "$file" "${file%.jpeg}.jpg"
  done
  echo "Task 1: JPEG files renamed."
}

# Define task2 function
task2() {
  # move all files in the Downloads folder to the Documents folder
  mv ~/Downloads/* ~/Documents/
  echo "Task 2: Files moved from Downloads to Documents."
}

# Define task3 function
task3() {
  # delete all files in the trash
  rm -rf ~/.local/share/Trash/*
  echo "Task 3: Trash emptied."
}

# Call functions to run tasks
task1
task2
task3
# End of script
