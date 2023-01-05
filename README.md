# networkreporting
This bash script that you can use to monitor all network activity on a server and send reports to an email address at 6:00am PST every day

This script uses the "netstat" command to capture network activity and writes the activity to a log file called "network_activity.log". The script runs continuously in the background, capturing network activity every minute.

At 6:00am PST every day, the script sends the log file as an email attachment to the specified email address using the "mail" command. It then clears the log file so that it is ready to capture the next day's activity.

To run this script, save it to a file and make it executable using the following command:

chmod +x dailynetworkreports.sh

Then, you can run the script by typing "./network_monitor.sh". The script will run in the background and will continue to monitor network activity and send reports even if the server is restarted.
