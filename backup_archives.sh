#!/bin/bash

# Define variables
group_number="24"
archive_dir="archived_logs_group${group_number}"
remote_host="your_remote_host"  # Replace with your sandbox host info
remote_username="your_remote_username"  # Replace with your sandbox username
remote_directory="/home/"

# Create archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Move all archived log files into the archive directory
mv heart_rate_log.txt_* "$archive_dir/" 2>/dev/null

# Check if files were moved
if [ $? -eq 0 ]; then
    echo "Archived log files moved to $archive_dir."
else
    echo "No archived log files found to move."
fi

# Backup the contents of the archive directory to the remote server
scp -r "$archive_dir/" "$remote_username@$remote_host:$remote_directory"

# Check if the scp command was successful
if [ $? -eq 0 ]; then
    echo "Backup to remote server completed successfully."
else
    echo "Error occurred while backing up to remote server."
fi
