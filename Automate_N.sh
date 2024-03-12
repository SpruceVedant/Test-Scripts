#!/bin/bash

# Define news website (replace with your preferred site)
NEWS_SITE="https://www.nytimes.com/section/world/international-news"

# Download the front page
wget -qO- $NEWS_SITE > news.txt

# Extract headlines using grep (modify for your site's structure)
grep -Eo '<h[1-6]([^<]+)</h[1-6]>' news.txt | head -n 5 > headlines.txt

# Read headlines
echo "Top 5 Headlines:"
cat headlines.txt

# Clean up temporary files (optional)
rm news.txt headlines.txt
