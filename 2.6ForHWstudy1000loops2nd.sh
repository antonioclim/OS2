#!/usr/bin/env bash  
# This line tells the system to use the Bash shell to execute the script.

# ------------------------------------------------------------
# This script demonstrates **two different methods** to extract the 7th field 
# from the system file `/etc/passwd` (which contains user account information).
# The two methods are:
# 1. Using the `cut` command (a slower approach).
# 2. Using Bash variable expansion (`##`) (a faster approach).
#
# The script measures the time taken for each method to run 1,000 times.
# ------------------------------------------------------------

# ----------------------------------
# VAR1: Using `cut` (Slower Method)
# ----------------------------------
echo "Using cut command"

# Measure execution time for 1,000 iterations of `cut`.
# `cut` extracts the 7th field (the default shell for each user).
time for count in {1..1000}  # Loop runs 1,000 times
do
  cut -d ":" -f 7 </etc/passwd > /dev/null  # Extract field 7 and discard output
done

# ------------------------------------------------------
# VAR2: Using `##` for Bash Variable Expansion (Faster)
# ------------------------------------------------------
echo "Using ## for string manipulation"

# This method reads each line from `/etc/passwd` and extracts the last field 
# (the default shell for each user) **without using cut**.
# Instead, `${REPLY##*:}` removes everything before the last `:` 
# (which is much faster because it avoids calling external commands).
time for count in {1..1000}
do
  while read  # Read each line of /etc/passwd
  do
    echo "${REPLY##*:}" > /dev/null  # Extract last field and discard output
  done </etc/passwd
done

# ----------------------------------------------
# Scope of this script for students:
# ----------------------------------------------
# This script teaches:
# 1. **Extracting Data from System Files** - How to retrieve specific fields from `/etc/passwd`.
# 2. **Using External vs Built-in Tools** - Shows the difference between `cut` and Bash expansion.
# 3. **Performance Optimization** - Demonstrates that **built-in Bash features** are often faster.
# 4. **Benchmarking Execution Time** - The `time` command helps compare efficiency.

# Why is this useful?
# - Helps students **process system files efficiently** (e.g., logs, user info).
# - Teaches **performance-aware scripting**: built-in Bash operations are faster than calling commands.
# - Useful for **system administrators** when working with user accounts, shells, and configurations.

# Key takeaway: **Use Bash variable expansion for better performance and efficiency! 🚀**
