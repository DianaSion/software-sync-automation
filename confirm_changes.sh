#!/bin/bash
# Confirmation Button Script

read -p "Are you sure? (yes/no): " response
if [ "$response" == "yes" ]; then
    echo "Changes confirmed. Proceeding with synchronization."
    # Add synchronization logic here
else
    echo "Action canceled."
    exit 1
fi