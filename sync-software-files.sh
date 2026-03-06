#!/bin/bash

# A script to sync software files to the repository.

REPO_DIR="$(pwd)"

# Function to sync files
sync_files() {
    for file in $(git status -s | awk '{print $2}'); do
        git add "$file"
    done
    if [ -n "$(git status -s)" ]; then
        git commit -m "Automated sync: $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin main
    else
        echo "No changes to sync."
    fi
}

# Traverse directories and sync files
if [ -d "$REPO_DIR" ]; then
    cd "$REPO_DIR" || exit
    sync_files
else
    echo "Repository directory does not exist."
fi
