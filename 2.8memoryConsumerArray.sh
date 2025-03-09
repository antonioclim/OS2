#!/bin/bash
# This line tells the system to use the Bash shell to execute the script.

# --------------------------------------------
# This script demonstrates:
# 1. **Array initialization and usage** in Bash.
# 2. **Generating large numbers** using `$RANDOM`.
# 3. **Tracking memory usage impacts** in Bash scripts.
#
# ⚠️ WARNING: This script creates a **very large array** that can consume 
# significant memory. Use with caution, especially on low-memory systems.
# --------------------------------------------

# Declare an array named `big_array`
declare -a big_array

# --------------------------------------------
# Loop to populate the array with large numbers
# --------------------------------------------
# The loop runs **10,000,000 times**, storing large numbers in the array.
for i in {1..10000000}; do
    # Generate a large random number by concatenating `$RANDOM` multiple times.
    # `$RANDOM` generates a number between 0-32767, so combining four of them creates a much larger value.
    big_array[i]=$RANDOM$RANDOM$RANDOM$RANDOM

    # Every **100,000 iterations**, print the current array size to track progress.
    if ! ((i % 100000)); then
        echo "Array size: $i"
    fi
done

# --------------------------------------------
# Display final results
# --------------------------------------------
# Print the total number of elements stored in the array.
echo "Final array size: ${#big_array[@]}"

# Inform the user about memory usage concerns.
echo "Memory usage increased. Please monitor your system's resources."

# ----------------------------------------------
# Scope of this script for students:
# ----------------------------------------------
# This script teaches:
# 1. **Arrays in Bash** - Declaring and using indexed arrays.
# 2. **Using `$RANDOM`** - Creating large random numbers in shell scripting.
# 3. **Looping and Performance Awareness** - Handling loops with millions of iterations.
# 4. **Memory Management Considerations** - Demonstrates how large arrays impact system performance.

# Why is this useful?
# - Shows how to use **arrays** to store large datasets in Bash.
# - Demonstrates **how memory usage scales** when working with large datasets.
# - Teaches **performance monitoring** through periodic updates during execution.
# - **Critical learning:** Students see why excessive memory usage can **slow down or crash** a system.

# ⚠️ **Caution:** Running this script on a low-memory system may lead to **high RAM usage and slow performance**.
# Ensure you **monitor system resources** and **terminate if necessary**.

# Key takeaway: **Efficient memory management is crucial when working with large datasets in scripting! 🚀**
