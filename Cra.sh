# This script creates react app boilerplate
#!/bin/bash

read -p "Enter project name: " project_name

npx create-react-app "$project_name"

echo "React app created successfully!"
