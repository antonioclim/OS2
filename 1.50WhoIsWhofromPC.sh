#!/bin/bash

# ==========================
# STUDENT LOGIN MONITORING SCRIPT
# ==========================
# This script retrieves information about currently logged-in users (students).
# It displays:
# 1. The username of the logged-in student.
# 2. The IP address or hostname from which they are connected.
# 3. The last five commands executed by the student on the server.

# ==========================
# DISPLAYING LOGGED-IN USERS
# ==========================
echo "Currently logged-in students:"

# The "who" command lists all users currently logged into the system.
# - It displays the username, terminal, login time, and the remote IP or hostname.
# - We format it to show only relevant details: USERNAME | TERMINAL | IP/HOSTNAME
who | awk '{print "User: " $1, " | Terminal: " $2, " | IP: " $5}'

# ==========================
# RETRIEVING LAST COMMANDS
# ==========================
echo ""
echo "Last five commands executed by each student:"

# Loop through each logged-in student to extract their command history.
while read user terminal ip; do
    echo ""
    echo "User: $user | IP: $ip"
    echo "Last 5 commands executed on this server:"

    # Retrieve the last 5 commands from their history file.
    # The history file is usually stored at /home/USERNAME/.bash_history.
    if [[ -f "/home/$user/.bash_history" ]]; then
        tail -n 5 "/home/$user/.bash_history"
    else
        echo "No history file found for $user"
    fi
done < <(who | awk '{print $1, $2, $5}')

echo ""
echo "Script execution completed."

# =======================================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =======================================================
# 1. How to use the "who" command to list logged-in users.
# 2. How to extract information using "awk" and format output.
# 3. How to loop through user data in a script.
# 4. How to access a user's command history safely.
# 5. How to use "tail" to retrieve the last few lines from a file.

# =======================================================
# WHY IS THIS USEFUL?
# =======================================================
# - Useful for monitoring student activity in real-time.
# - Helps track login sessions and identify where students are connecting from.
# - Useful for debugging if students face issues while executing commands.
# - Reinforces the importance of system administration and user monitoring.
