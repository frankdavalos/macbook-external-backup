#!/bin/bash

# Variables
PRIMARY_DRIVE="/Volumes/PrimaryDrive"  # Replace with the name of the primary drive
BACKUP_DRIVE="/Volumes/BackupDrive"   # Replace with the name of the backup drive
LOG_FILE="$HOME/backup_log.txt"
LOCK_FILE="/tmp/backup_script.lock"

# Check if another instance of the script is running
if [ -e "$LOCK_FILE" ]; then
    echo "$(date): Backup already in progress. Exiting..." | tee -a "$LOG_FILE"
    exit 1
fi

# Create lock file and save PID
echo $$ > "$LOCK_FILE"

# Verify both drives are connected
if [ ! -d "$PRIMARY_DRIVE" ] || [ ! -d "$BACKUP_DRIVE" ]; then
    echo "$(date): Error: One or both drives are not connected." | tee -a "$LOG_FILE"
    rm -f "$LOCK_FILE"
    exit 1
fi

# Perform the backup
echo "$(date): Starting backup from $PRIMARY_DRIVE to $BACKUP_DRIVE..." | tee -a "$LOG_FILE"
rsync -avh --delete --progress "$PRIMARY_DRIVE/" "$BACKUP_DRIVE/" 2>&1 | tee -a "$LOG_FILE"

# Check rsync result
if [ $? -eq 0 ]; then
    echo "$(date): Backup completed successfully." | tee -a "$LOG_FILE"
else
    echo "$(date): Backup failed." | tee -a "$LOG_FILE"
fi

# Remove lock file
rm -f "$LOCK_FILE"
