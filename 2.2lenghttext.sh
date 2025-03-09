#!/bin/bash  # This line tells the system to use the Bash shell to run the script

# Prompt the user to enter some text
read -p "Enter some text here: " text  

# Count the number of characters in the text and display the result
echo "Your text has ${#text} characters."

# ==========================
# 📌 LEARNING OBJECTIVES 📌
# ==========================
# 🟢 This script introduces students to:
#   - Using `read` to get user input
#   - Storing input in a variable
#   - Using `${#variable}` to count the number of characters in a string
#   - Displaying output using `echo`
#   - Writing a simple, interactive Bash script

# 🟢 WHY IS THIS USEFUL?
#   - This is a **fundamental concept** in shell scripting.
#   - It helps with **user interaction** (taking input and processing it).
#   - Character counting is useful for **validating passwords, messages, or input length**.
#   - A **small step toward automation** in system administration and programming.

# 🟢 HOW CAN STUDENTS APPLY THIS?
#   - Modify it to count **words** instead of characters (`wc -w` command).
#   - Expand it to check **if the text is too short or too long**.
#   - Use it as a base to **process files and filter content**.

# 🚀 THIS SCRIPT SHOWS THAT EVEN SIMPLE BASH COMMANDS CAN HAVE PRACTICAL USES!
