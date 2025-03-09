#!/bin/sh

# This script demonstrates basic user interaction, system commands, and loops in Bash.
# It also detects and displays the actual operating system of the machine.

# Prompt the user to enter their last name in uppercase letters
echo "Enter your last name in uppercase letters:"

# Read user input and store it in the variable FAM
read FAM

# Greet the user using the entered name
echo "Hello, $FAM!"

# Display the current date and time using the 'date' command
echo "Today’s date is: $(date)"

# Display the current IP address of the machine using 'hostname -I'
echo "Your IP address is: $(hostname -I)"

# Detect and display the real operating system using 'uname' command
OS=$(uname)  # The 'uname' command retrieves the system's OS name

# Print the detected operating system
echo "Your real operating system is: $OS"

# End of script

#############################################
# 📌 What Students Learn from This Script:
#############################################

# 1️⃣ **Reading User Input**: 
#    - The script asks for user input and stores it in a variable (`read FAM`).
#
# 2️⃣ **String Manipulation**: 
#    - It displays a personalized greeting (`echo "Hello, $FAM!"`).
#
# 3️⃣ **System Commands**:
#    ✅ `date` - Displays the current date and time.
#    ✅ `hostname -I` - Retrieves the system's IP address.
#    ✅ `uname` - Detects and prints the actual operating system.
#
# 4️⃣ **Variable Usage**:
#    ✅ The script stores the operating system name in a variable (`OS`) and prints it.
#
# 5️⃣ **Basic Bash Scripting Concepts**:
#    ✅ Running system commands inside scripts.
#    ✅ Using variables to store and manipulate user input.
#    ✅ Understanding system detection in Bash.

#############################################
# 🎯 Why Is This Useful?
#############################################

# ✅ This script introduces essential Bash scripting skills in a simple way.
# ✅ It teaches students how to interact with users and retrieve system information.
# ✅ It ensures students understand how to use system commands for automation.
# ✅ Knowing how to detect the OS dynamically is crucial for writing cross-platform scripts.
