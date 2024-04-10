#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error: Insufficient arguments provided."
    echo "Usage: $0 <file_name> <project_id>"
    exit 1
fi

file_name="$1"
if [ ! -f "$file_name" ]; then
    echo "Error: $file_name file not found."
    exit 1
fi

project_id="$2"
if [ -z "$project_id" ]; then
    echo "Error: Project ID not provided."
    exit 1
fi

file_name_without_extension=$(basename "$file_name" .txt)

ip_addresses=()
while IFS= read -r line; do
    ip_addresses+=("$line")
done < "$file_name"

for ip in "${ip_addresses[@]}"; do
	#echo "$ip, $project_id, $file_name_without_extension"
	atlas accessList create "$ip" --type ipAddress --projectId "$project_id" --comment "$file_name_without_extension" --output json
done
