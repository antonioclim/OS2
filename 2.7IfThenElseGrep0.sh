#!/usr/bin/env bash
# This line tells the system to use the Bash shell to execute the script.

# ------------------------------------------------------------
# This script is a simple number guessing game.
# It asks the user to enter a number and checks:
# 1. If the input is a valid integer.
# 2. If the input matches the "magic number" (which is 7).
#
# The script demonstrates basic **user input handling**, **pattern matching**, 
# and **conditional logic** in Bash.
# ------------------------------------------------------------

# Prompt the user to enter a number
echo -en "Please guess the magic number: " 

# Read user input and store it in variable X
read X

# --------------------------------------------
# Input Validation: Check if X is a valid number
# --------------------------------------------
# `grep "[^0-9]"` searches for **any character that is NOT a digit (0-9)**.
# If grep finds a match, that means the input contains non-numeric characters.
# `> /dev/null 2>&1` suppresses output and errors.
echo $X | grep "[^0-9]" > /dev/null 2>&1

# The `$?` variable stores the exit status of the last command.
# 0 means no match (valid number), non-zero means a match (invalid input).
if [ "$?" -eq "0" ]; then  
  # If grep found something other than digits (0-9), it's not a valid number.
  echo "Sorry, wanted a number"
else
  # The input contains only numbers, so we can proceed with the comparison.

  # --------------------------------------------
  # Check if the number is the "magic number" (7)
  # --------------------------------------------
  if [ "$X" -eq "7" ]; then  
    # If the user entered 7, they guessed correctly.
    echo "You entered the magic number!"
  fi
fi

# ----------------------------------------------
# Scope of this script for students:
# ----------------------------------------------
# This script teaches:
# 1. **User Input Handling** - Using `read` to capture user input.
# 2. **Pattern Matching with `grep`** - Checking if the input is a valid number.
# 3. **Exit Status (`$?`)** - Using the exit code of `grep` for decision-making.
# 4. **Conditional Logic (`if` statements)** - Validating and comparing input values.

# Why is this useful?
# - Helps students understand **input validation**, preventing incorrect user input.
# - Demonstrates **pattern matching** with `grep`, useful in text processing.
# - Shows **how to handle numeric comparisons** safely in Bash scripts.
# - Introduces **error handling**, which is essential in real-world scripting.

# Key takeaway: **Always validate user input before processing it! 🚀**
