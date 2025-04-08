#!/bin/bash
set -x
# Output file
OUTPUT_FILE="summary.txt"

# Clear the output file if it exists
#> "$OUTPUT_FILE"

# Function to process each file
process_file() {
    local file="$1"
    # Skip directories and the script itself
    if [[ -f "$file" && "$file" != "$0" && "$file" != "$OUTPUT_FILE" ]]; then
        echo "=== $file ===" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo -e "\n" >> "$OUTPUT_FILE"
    fi
}

# Export the function so find can use it
export -f process_file

# Find all files and process them
find . -type f -exec bash -c 'process_file "$0"' {} \;

echo "Summary generated in $OUTPUT_FILE"
