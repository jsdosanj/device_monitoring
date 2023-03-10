#!/bin/bash

# Set the email address to send the reports to
email=email@email.com

# Set the time to send the reports (6:00am PST)
hour=6
timezone=PST

# Set the log file name
log_file=device_info.log

# Display device information
echo "Device Name: $(hostname)" >> $log_file
echo "Hostname: $(hostname -f)" >> $log_file
echo "Users: $(who)" >> $log_file
echo "Storage: $(df -h)" >> $log_file
echo "RAM: $(free -h)" >> $log_file
echo "CPU: $(lscpu)" >> $log_file
echo "GPU: $(lspci | grep -i vga)" >> $log_file
echo "Internet Connection: $(nmcli connection show --active)" >> $log_file
echo "Firewall Settings: $(ufw status)" >> $log_file
echo "BitLocker: $(manage-bde -status)" >> $log_file

# Continuously monitor network activity and write to the log file
while true; do
    # Capture the current date and time
    date_time=$(date +"%Y-%m-%d %T %Z")

    # Capture the network activity
    network_activity=$(netstat -an)

    # Write the date and time and network activity to the log file
    echo "$date_time" >> $log_file
    echo "$network_activity" >> $log_file
    echo "" >> $log_file

# Check for software updates every hour
while true; do
    # Check for updates
    updates=$(apt-get update)

    # Write the update status to the log file
    echo "$date_time" >> $log_file
    echo "$updates" >> $log_file
    echo "" >> $log_file

    # Sleep for 1 minute before capturing the next batch of activity
    sleep 60
done &

# Wait until the specified time to send the reports
while true; do
    # Get the current hour and timezone
    current_hour=$(date +"%H" -d "1 hour ago")
    current_timezone=$(date +"%Z")

    # Check if it is time to send the reports
    if [ $current_hour -eq $hour ] && [ $current_timezone == $timezone ]; then
        # Send the log file as an email attachment
        cat $log_file | mail -s

