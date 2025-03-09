#!/bin/bash

# ===============================
# Script to Create and Compile a Simple C Program
# ===============================
# This script creates a basic C program that asks the user for their name,
# compiles it using GCC, and runs the resulting executable.
# It also ensures the program is compiled with debugging symbols for use with GDB.

# Define the C source file and executable file names
C_FILE="hello_name.c"
EXE_FILE="hello_name"

# ===============================
# C PROGRAM CREATION USING EOF
# ===============================
# Using "cat <<EOF > $C_FILE" to write a simple C program inside the script.
# This program:
# 1. Prompts the user to enter their name.
# 2. Reads the input safely (limiting buffer size to prevent overflow).
# 3. Prints a greeting message.

cat <<EOF > $C_FILE
#include <stdio.h>

int main() {
    char name[50];  // Array to store user input

    printf("Enter your name: ");  // Prompt message
    scanf("%49s", name);  // Read user input (safe from buffer overflow)

    printf("Hello, %s!\\n", name);  // Display the greeting message
    return 0;
}
EOF

# ===============================
# COMPILING THE C PROGRAM
# ===============================
# Using "gcc" (GNU Compiler Collection) to compile the C file.
# The "-o" flag specifies the output executable name.
# The "-g" flag includes debugging symbols (for use with GDB).
# -O0  : Disables optimization (prevents GCC from removing variables).
gcc -g -O0 $C_FILE -o $EXE_FILE

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful! Running the program..."
    ./$EXE_FILE  # Run the compiled program
else
    echo "Compilation failed!"
fi

# ===============================
# WHAT STUDENTS LEARN
# ===============================
# - How to use a Bash script to create and write a C program dynamically.
# - The use of "cat <<EOF" to include multiline text inside a script.
# - How to compile a C program using GCC in Bash.
# - The importance of using "-g" for debugging with GDB.
# - How to check for compilation success using "$?".

# ===============================
# WHY IS THIS USEFUL?
# ===============================
# - Automates the process of writing, compiling, and running C programs.
# - Helps beginners understand basic C input/output and memory handling.
# - Provides an easy way to analyze compiled assembly using GDB.
# - Useful in teaching environments where students need structured learning.
