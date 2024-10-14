#!/bin/bash

# Prompt for the device name
echo "Enter the device name (e.g., Monitor_A, Monitor_B, ...):"
read device_name

# Log file
log_file="heart_rate_log.txt"

# Function to generate a random heart rate between 50 and 100
generate_heart_rate() {
    echo $((50 + RANDOM % 51))
}

# Function to log heart rate with timestamp
log_heart_rate() {
    while true
    do
        # Get the current timestamp
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")

        # Generate a simulated heart rate
        heart_rate=$(generate_heart_rate)

        # Log the data to the file
        echo "$timestamp $device_name $heart_rate" >> "$log_file"

        # Wait for 1 second
        sleep 1
    done
}

# Start logging in the background
log_heart_rate &

# Get the PID of the background process
pid=$!

# Display the PID for management
echo "Heart rate monitoring started in the background with PID: $pid"
