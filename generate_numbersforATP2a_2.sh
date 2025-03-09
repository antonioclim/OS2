#!/bin/bash

# =========================================
# SCRIPT: Generate a Sample File for read_vector.sh
# =========================================
# This script creates a file with random floating-point numbers.
# These numbers will be used as input for the vector-reading script.

# Define the filename
FILENAME="$HOME/ATP2a_2_numbers.txt"

# Define how many numbers to generate
NUMBERS_COUNT=10000  # You can change this to generate more numbers

# Inform the user about the file creation
echo "Generating a file with $NUMBERS_COUNT random floating-point numbers..."
echo "File will be saved as: $FILENAME"

# Create or overwrite the file
> "$FILENAME"  # Empty the file if it exists

# Generate random numbers and write to the file
for ((i = 1; i <= NUMBERS_COUNT; i++)); do
    # Generate a random floating-point number between 0 and 100
    RANDOM_NUM=$(awk -v min=0 -v max=100 'BEGIN{srand(); print min+rand()*(max-min)}')
    
    # Format the number with two decimal places and save to file
    printf "%4.2f\n" "$RANDOM_NUM" >> "$FILENAME"
done

# Confirm file creation
echo "File $FILENAME has been created successfully with random numbers."

# =========================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =========================================
# ✅ How to generate and write random floating-point numbers in Bash
# ✅ How to format numbers with `printf`
# ✅ How to create and overwrite files in Bash
# ✅ How to use loops and basic math operations in shell scripting

# =========================================
# WHY IS THIS SCRIPT USEFUL?
# =========================================
# 🔹 It provides a simple way to generate structured numeric data for testing.
# 🔹 Helps students understand file handling and data formatting.
# 🔹 Serves as a practical introduction to loops, variables, and arithmetic in Bash.
# 🔹 Can be modified to generate different types of structured data for practice.

