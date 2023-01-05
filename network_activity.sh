#!/bin/bash

# Set the email address to send the reports to
email=email@email.com

# Set the log file name
log_file=network_activity.log

# Continuously monitor network activity and write to the log file
while true; do
    # Capture the current date and time
    date_time=$(date +"%Y-%m-%d %T %Z")

    # Capture the network activity
    network_activity=$(iw dev wlan0 station dump)

    # Write the date and time and network activity to the log file
    echo "$date_time" >> $log_file
    echo "$network_activity" >> $log_file
    echo "" >> $log_file

    # Sleep for 1 minute before capturing the next batch of activity
    sleep 60
done &

# Wait until the specified time to send the reports
while true; do
    # Send the log file as an email attachment
    cat $log_file | mail -s "Network Activity Report" -a $log_file $email

    # Clear the log file
    > $log_file

    # Sleep for 1 hour before sending the next report
    sleep 3600
done
