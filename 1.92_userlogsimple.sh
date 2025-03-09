#!/bin/bash

# This script logs user activity on the system.
# It records the current date and time along with details about logged-in users.
# The data is stored in a file named 'userlog.txt' inside the user's home directory.

# Define the log file path inside the user's home directory
USERLOG="$HOME/userlog.txt"

# Get the current date and time in a readable format (e.g., "Mar 10 14:35:22")
DATETIME=$(date "+%b %d %T")

# Append the date, time, and hostname (computer name) to the log file
echo "${DATETIME} ${HOSTNAME}" >> $USERLOG

# The 'w' command shows information about logged-in users.
# 'tail -n +2' removes the first line (header) from 'w' output.
# 'awk' extracts and formats:
# - Username
# - TTY (terminal session)
# - Login time
# - Idle time
# - Process running in the session
w | tail -n +2 | awk '{print "- "$1","$2","$3","$4","$7}' >> $USERLOG

# Alternative method (commented out) using 'sed' to remove the first line instead of 'tail'.
# w | sed -n '2,$ p' | awk '{print "- "$1","$2","$3","$4","$7}' >> $USERLOG

# Where to see the output
echo " Type cat ~/userlog.txt "

########################################################################
# 📌 What Students Learn from This Script:
########################################################################

# 1️⃣ **How to Log System Activity**
#    ✅ Capturing system date and time using `date`
#    ✅ Recording system hostname using `$HOSTNAME`
#    ✅ Storing information in a text file using `echo >>`

# 2️⃣ **Understanding the 'w' Command**
#    - The `w` command provides details of currently logged-in users.
#    - Students learn how to extract relevant data and format it using `awk`.

# 3️⃣ **Using Text Processing Commands in Bash**
#    - `tail -n +2` removes the first line from command output.
#    - `awk` extracts specific fields and formats them.

########################################################################
# 🎯 Why Is This Useful?
########################################################################

# ✅ This script **helps track who is logged in and when**.
# ✅ It teaches **how to automate logging user activity** for monitoring purposes.
# ✅ Understanding `w`, `awk`, and `tail` is **essential for system administrators**.
# ✅ The script is **lightweight and can run in the background** for logging user sessions.

# 🚀 This is an introduction to **system monitoring and log management** in Bash!
