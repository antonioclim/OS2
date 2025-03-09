#!/bin/bash

# =========================================
# FUNCTION: Read Vector Elements from a File into an Array
# =========================================
# This function reads the contents of a given file and stores each line as an element in an array.
# The array is passed by reference, meaning it can be modified inside the function.
# Requires Bash version 4.3+ for the "local -n" feature (name references).

preluare_vector_1() {
    local nume_fisier="$1"  # Store the filename (first argument)
    local -n arr=$2         # Reference to the array provided as second argument
    local i=0               # Counter to keep track of array indices

    # =========================================
    # READ FILE LINE BY LINE AND STORE IN ARRAY
    # =========================================
    # IFS= prevents leading/trailing whitespace from being removed.
    # read -r prevents the backslash `\` from being treated as an escape character.
    while IFS= read -r line || [[ -n "$line" ]]; do
        arr[i++]="$line"  # Assign the line content to the array and increment index
    done < "$nume_fisier"
}

# =========================================
# MAIN SCRIPT EXECUTION
# =========================================

# Prompt the user to enter the filename to read
echo -n "Enter the name of the file to read from: "
read nume_fisier  # Read filename input from the user

declare -a a  # Declare an array 'a' to store the file contents

# Call the function to read the file and populate the array
preluare_vector_1 "$nume_fisier" a  

# =========================================
# PRINTING THE ARRAY ELEMENTS
# =========================================
# Loop through the array and print each element formatted as a floating-point number with one decimal place
echo "Contents of the file as numbers:"
for (( i = 0; i < ${#a[@]}; i++ )); do
    printf "%4.1f ," "${a[i]}"
done
echo  # Print a newline at the end for better output formatting

# =========================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =========================================
# ✅ How to read data from a file line by line in Bash
# ✅ How to use functions with arguments in Bash
# ✅ How to use Bash arrays and pass them to functions
# ✅ How to store data dynamically and process it in loops
# ✅ How to format and display numbers using `printf`
# ✅ How to prompt the user for input (`read`)
# ✅ How to handle and process text data in a structured way

# =========================================
# WHY IS THIS SCRIPT USEFUL?
# =========================================
# 🔹 Demonstrates reading structured numerical data into memory efficiently.
# 🔹 Helps students understand how to work with file input in Bash.
# 🔹 Shows how to store and manipulate data in arrays.
# 🔹 Provides a practical way to process numerical datasets.
# 🔹 Encourages learning of Bash functions, loops, and text processing techniques.
