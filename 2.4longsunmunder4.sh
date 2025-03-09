#!/bin/bash  
# This line tells the system to use the Bash shell to execute the script.

# This script calculates the sum of all numbers from 1 to 1,000,000.
# It demonstrates the use of loops, arithmetic operations, and variables in Bash.

# Initialize a variable to store the total sum.
# We start with 0 because we will be adding numbers to it.
total_sum=0

# Loop from 1 to 1,000,000
# The `{1..1000000}` syntax generates numbers from 1 to 1,000,000 in order.
for i in {1..1000000}
do
    # Add the current number (i) to the total sum
    total_sum=$((total_sum + i))
done

# After the loop finishes, print the final sum
echo "The total sum is: $total_sum"

# ----------------------------------------------
# Scope of this script for students:
# ----------------------------------------------
# This script is useful for learning the following Bash concepts:
# 1. **Loops** - How to repeat a task multiple times using a `for` loop.
# 2. **Variables** - How to store and update values in variables (`total_sum`).
# 3. **Arithmetic Operations** - How to perform addition in Bash using `$((...))`.
# 4. **Efficiency Consideration** - A loop like this is slow; in real applications, 
#    we use a mathematical formula for quick results:
#       Sum = n(n+1)/2
#    In Bash, it would be:
#       n=1000000
#       total_sum=$((n * (n + 1) / 2))
#       echo "The total sum is: $total_sum"
#
# Why is this useful?
# - Understanding **loops** is crucial for automating repetitive tasks.
# - **Arithmetic operations** are fundamental in programming.
# - Helps students **think about optimization** when solving problems in Bash.
