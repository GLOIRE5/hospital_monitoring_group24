#!/bin/bash

# Define variables
group_number="24"
archive_dir="archived_logs_group24"
remote_host="e683b63e5434.15cf1724.alu-cod.online"
remote_username="e683b63e5434"
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
