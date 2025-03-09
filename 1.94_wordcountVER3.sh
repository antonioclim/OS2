#!/bin/bash

# ==========================
# WORD SEARCH SCRIPT
# ==========================
# This script allows the user to search for a word in a specified directory containing text files.
# It calculates:
# 1. How many times the word appears in all files.
# 2. The total number of files in the directory.
# 3. The total number of words across all documents.
# 4. The time it takes to complete the search.

# ==========================
# USER INPUT
# ==========================
# Ask the user for the word they want to search for.
echo "Which word do you want to search for?"
read search_word  # Read user input and store it in the variable "search_word"

# Ask the user where to search (which directory).
echo "Where do you want to search? (Enter directory path)"
read search_directory  # Read user input and store it in "search_directory"

# Check if the directory exists before continuing.
if [ ! -d "$search_directory" ]; then
    echo "Error: The directory '$search_directory' does not exist."
    exit 1  # Exit the script with an error code.
fi

# ==========================
# MEASURING START TIME
# ==========================
# Capture the current time in nanoseconds before starting the search.
start_time=$(date +%s%N)

# ==========================
# COUNTING WORD OCCURRENCES
# ==========================
# The "grep" command searches recursively (-r) and ignores case (-i).
# The "-o" flag ensures it counts each occurrence separately.
# "wc -l" counts the number of occurrences found.
occurrences=$(grep -rio --ignore-case "$search_word" "$search_directory" | wc -l)

# ==========================
# COUNTING NUMBER OF DOCUMENTS
# ==========================
# The "find" command searches for all files in the specified directory.
# "wc -l" counts the total number of files found.
num_files=$(find "$search_directory" -type f | wc -l)

# ==========================
# COUNTING TOTAL WORDS IN ALL DOCUMENTS
# ==========================
# The "find" command finds all files, and "wc -w" counts the words in each file.
# "awk" sums up the total word count across all files.
total_words=$(find "$search_directory" -type f -exec wc -w {} + | awk '{total += $1} END {print total}')

# ==========================
# DISPLAYING RESULTS
# ==========================
# Print the results of the search.
echo "Word to search: '$search_word'"
echo "Searching in directory: '$search_directory'"
echo "Number of occurrences: $occurrences"
echo "Number of documents: $num_files"
echo "Total number of words across all documents: $total_words"

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

# Convert nanoseconds to milliseconds for readability.
execution_time_ms=$((execution_time / 1000000))

echo "Execution time: $execution_time_ms milliseconds"

# =======================================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =======================================================
# 1. How to ask for user input with "read".
# 2. How to validate if a directory exists using "if [ ! -d ]".
# 3. How to use "grep" for searching words in multiple files.
# 4. How to use "find" to count the number of files in a directory.
# 5. How to use "wc -w" to count the total number of words in multiple files.
# 6. How to measure script execution time using "date +%s%N".
# 7. How to use "awk" for summing values.
# 8. How to make a script interactive by allowing the user to specify where to search.

# =======================================================
# WHY IS THIS USEFUL?
# =======================================================
# - Helps students understand how to process large text datasets efficiently.
# - Demonstrates the power of command-line tools for searching and counting.
# - Shows how to optimize performance using built-in Bash tools instead of slow loops.
# - Allows users to search for specific words in any directory, making it useful for data analysis, research, or log file monitoring.
