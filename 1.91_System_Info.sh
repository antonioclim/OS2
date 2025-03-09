#!/bin/bash

# This script provides information about the system's current state.
# It displays memory usage, disk usage, and uptime (how long the system has been running).

# Displaying volatile memory (RAM) usage
echo "📌 Volatile Memory (RAM) Usage:"
# The 'free -h' command shows the available and used RAM in a human-readable format (-h flag).
/usr/bin/free -h

# Displaying HDD (Hard Disk Drive) usage
echo "📌 HDD (Disk) Usage:"
# The 'df -h' command shows the disk space usage of all mounted filesystems (-h makes it readable).
/usr/bin/df -h

# Displaying system uptime (time since last reboot)
echo "📌 System Uptime:"
# The 'uptime' command shows how long the system has been running since the last reboot.
uptime

# Exit the script
exit

##############################################################
# 📌 What Students Learn from This Script:
##############################################################

# 1️⃣ **How to Check System Status**
#    ✅ Understanding RAM usage with `free -h`
#    ✅ Monitoring disk usage with `df -h`
#    ✅ Checking how long the system has been running with `uptime`

# 2️⃣ **Using System Commands in Bash**
#    - Students learn how to execute important system monitoring commands from a script.
#    - They see how Bash can be used to automate system health checks.

# 3️⃣ **Using the 'echo' Command**
#    - The script uses `echo` to display clear labels before each system command output.
#    - This improves readability and helps users understand the output.

##############################################################
# 🎯 Why Is This Useful?
##############################################################

# ✅ This script is a **quick way to monitor system performance**.
# ✅ It helps **beginners understand basic system administration commands**.
# ✅ It **teaches automation** – instead of typing commands manually, you can run a script.
# ✅ Knowing system memory, disk usage, and uptime is **essential for troubleshooting**.
