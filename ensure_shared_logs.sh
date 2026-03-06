#!/bin/bash
# Script to ensure evidence logs are mirrored to visible shared storage

LOG_FILE="evidence-log.md"
BACKUP_FILE="evidence-log-backup-$(date '+%Y-%m-%d_%H-%M-%S').md.enc"
STORAGE_DIR="/visible-logs/"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found. Please ensure $LOG_FILE exists in the repository."
    exit 1
fi

# Create encrypted backup
openssl enc -aes-256-cbc -salt -in "$LOG_FILE" -out "$STORAGE_DIR/$BACKUP_FILE" -k 'shared-secret-key'
if [ $? -eq 0 ]; then
    echo "Evidence log successfully encrypted and mirrored to shared storage."
else
    echo "Failed to encrypt and backup the evidence log."
    exit 1
fi
