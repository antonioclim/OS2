#!/usr/bin/env bash  
# This line tells the system to use the Bash shell to execute the script.

# ------------------------------------------------------------
# Bash provides a powerful way to manipulate text using special symbols: 
#   - `#` (removes shortest match from the beginning)
#   - `##` (removes longest match from the beginning)
#   - `%` (removes shortest match from the end)
#   - `%%` (removes longest match from the end)
#
# These are called **Bash variable expansions** and allow text processing 
# without using external commands like `cut`, making execution much faster.
# ------------------------------------------------------------

# Define a sample string with multiple values separated by colons
STRING="Name:Date:Shell"

# ----------------------------------
# VAR1: Using `cut` (Slower Method)
# ----------------------------------
echo "Using cut command"

# Measure execution time for 1,000 iterations of the `cut` command.
# `cut` extracts the 3rd field from the STRING (delimited by ":").
time for A in {1..1000}  # Loop runs 1,000 times
do
  cut -d ":" -f 3 > /dev/null <<<"$STRING"  # Extract the 3rd field ("Shell") and discard output
done

# ----------------------------------
# VAR2: Using `##` (Faster Method)
# ----------------------------------
echo "Using ## for string manipulation"

# This approach uses **Bash variable expansion** instead of `cut`.
# `${STRING##*:}` removes everything **before** the last `:` leaving only "Shell".
# This avoids spawning a new process (`cut`), making execution **much faster**.
time for A in {1..1000}
do
  echo "${STRING##*:}" > /dev/null  # Extract the last field ("Shell") and discard output
done

# ----------------------------------------------
# Scope of this script for students:
# ----------------------------------------------
# This script demonstrates:
# 1. **String Manipulation in Bash** - How to extract parts of a string using Bash expansion.
# 2. **Performance Optimization** - How avoiding external commands (`cut`) improves execution speed.
# 3. **Loops in Bash** - Using `for` loops to repeat operations multiple times.
# 4. **Timing Execution** - The `time` command helps compare performance between different approaches.

# Why is this useful?
# - Helps students **write efficient Bash scripts** by avoiding unnecessary commands.
# - Shows that **using built-in features** of Bash is often **faster** than external tools.
# - Understanding **text processing** is key when handling **logs, CSV files, and configuration files**.

# Key takeaway: **Use Bash variable expansion when possible for better performance! 🚀**
