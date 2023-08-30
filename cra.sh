# This script creates react app boilerplate
# for npx-create-react-app
#!/bin/bash

read -p "Enter project name: " project_name

npx create-react-app "$project_name"

echo "React app created successfully!"

