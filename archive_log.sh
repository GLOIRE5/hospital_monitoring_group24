#!/bin/bash

# Set the log file name
log_file="heart_rate_log.txt"

# Check if the log file exists
if [ -f "$log_file" ]; then
    # Get the current timestamp in the format YYYYMMDD_HHMMSS
    timestamp=$(date +"%Y%m%d_%H%M%S")

    # Set the new archive file name
    archive_file="${log_file}_${timestamp}"

    # Rename the log file to create an archive
    mv "$log_file" "$archive_file"

    # Confirm the archive creation
    echo "Log file archived as $archive_file"
else
    # Error message if the log file doesn't exist
    echo "Log file $log_file does not exist."
fi
