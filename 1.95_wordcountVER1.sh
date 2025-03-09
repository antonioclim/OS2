#!/bin/bash

# ==========================
# WORD SEARCH SCRIPT
# ==========================
# This script searches for a specific word in all text files within the "TXT" directory 
# located in the home directory of the user who runs the script. 
# It also calculates the execution time.

# ==========================
# MEASURING START TIME
# ==========================
# Capture the start time in nanoseconds to measure performance.
start_time=$(date +%s%N)

# ==========================
# SEARCH OPERATION
# ==========================
# Searching for the word "fuck" inside the TXT directory under the user's home folder.
# The path is dynamically set to "$HOME/TXT", so it works for any user.
grep -rio 'fuck' "$HOME/TXT" | wc -l

# ==========================
# COMMAND EXPLANATION
# ==========================
# This command counts how many times the word "fuck" appears in the TXT directory.
#
# - grep is the command used for searching text using patterns.
# - -r (--recursive) makes grep search all files in the specified directory and subdirectories.
# - -i (--ignore-case) makes the search case-insensitive (matches "fuck", "Fuck", "FUCK", etc.).
# - -o (--only-matching) prints only the matching words, each on a new line.
# - 'fuck' is the word to search.
# - "$HOME/TXT" specifies the directory where the search is performed.
# - | wc -l counts the number of occurrences (since each match is on a new line).

# ==========================
# MEASURING END TIME
# ==========================
# Capture the time after execution to measure performance.
end_time=$(date +%s%N)

# ==========================
# CALCULATING EXECUTION TIME
# ==========================
# The difference between the start and end time gives the execution time in nanoseconds.
execution_time=$((end_time - start_time))

# Convert nanoseconds to milliseconds for better readability.
execution_time_ms=$((execution_time / 1000000))

# Display the execution time.
echo "Execution time: $execution_time_ms milliseconds"

# =======================================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =======================================================
# 1. How to use grep to search for words in multiple files.
# 2. How to make scripts dynamic using "$HOME" to adapt to different users.
# 3. How to measure script execution time using "date +%s%N".
# 4. How to use pipes ("|") to pass output between commands.
# 5. How to count occurrences of a word efficiently in multiple files.

# =======================================================
# WHY IS THIS USEFUL?
# =======================================================
# - Helps students understand how to efficiently search text files from the command line.
# - Demonstrates the power of text processing tools like grep and wc.
# - Useful for text analysis, log file processing, and pattern recognition in documents.
# - Reinforces the importance of measuring script performance when handling large data.

