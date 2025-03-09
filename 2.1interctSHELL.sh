#!/bin/bash  # This line tells the system to use the Bash shell to run the script

# ==============================
# 🔍 CHECK IF THE SHELL IS INTERACTIVE
# ==============================

# The shell is "interactive" if the special variable PS1 is set.
# PS1 is the prompt string that appears when you type commands in a terminal.

if [ "${PS1-}" ]; then  # Check if PS1 exists and is not empty
  echo "Interactive shell"  # If PS1 is set, it means we are in an interactive shell
else
  echo "Non-interactive shell"  # If PS1 is not set, we are in a non-interactive shell
fi

# ==========================
# 📌 LEARNING OBJECTIVES 📌
# ==========================
# 🟢 This script helps students understand:
#   - The **difference between interactive and non-interactive shells**.
#   - The **importance of PS1**, which controls the command prompt appearance.
#   - **Conditional statements (`if` statements)** in Bash scripting.
#   - **Variable existence checking (`${VAR-}` syntax)** in Bash.

# 🟢 WHY IS THIS USEFUL?
#   - Interactive shells allow direct user input, **useful for debugging and running commands manually**.
#   - Non-interactive shells are used for **automation (e.g., scripts, cron jobs, remote executions)**.
#   - Understanding shell modes is essential for **troubleshooting script behavior**.

# 🟢 HOW CAN STUDENTS APPLY THIS?
#   - Modify it to **check and display more shell environment variables**.
#   - Extend it to detect **other types of shell environments** (e.g., login shells).
#   - Use this concept to **write scripts that behave differently based on shell type**.

# 🚀 THIS SCRIPT IS A FUNDAMENTAL STEP IN UNDERSTANDING HOW BASH INTERACTS WITH USERS AND SYSTEM PROCESSES!
