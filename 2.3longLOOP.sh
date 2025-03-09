#!/bin/bash  
# This line tells the system to use the Bash shell to run the script

# ==========================================
# 🔢 CALCULATE AND DISPLAY SQUARES OF NUMBERS
# ==========================================

# Define the upper limit of the loop
N=100  # This means we will calculate squares for numbers from 1 to 100

# ==================================
# 🌀 LOOP THROUGH NUMBERS FROM 1 TO N
# ==================================
for (( i=1; i<=N; i++ ))  # Loop starts at 1 and runs until it reaches N
do
    # 🧮 Calculate the square of the current number (i * i)
    square=$((i * i))  

    # 🖨️ Print the result in a readable format
    echo "The square of $i is $square"

    # 🕑 OPTIONAL: Slow down the loop by pausing for 1 second
    # Uncomment the next line to see each result appear slowly
    # sleep 1
done

# ✅ Print a final message when the loop is complete
echo "Finished calculating squares."

# ==========================
# 📌 LEARNING OBJECTIVES 📌
# ==========================
# 🟢 This script teaches students:
#   - **Loops (`for` loop)**: How to repeat an action multiple times.
#   - **Arithmetic operations (`$((...))`)**: Performing calculations in Bash.
#   - **Variables (`N`, `square`)**: Storing and using data inside a script.
#   - **Conditional execution (`i<=N`)**: Controlling when the loop stops.
#   - **Echo command (`echo "..."`)**: Displaying formatted output.

# 🟢 WHY IS THIS USEFUL?
#   - Loops are fundamental for **automation and data processing**.
#   - Understanding Bash arithmetic helps in **writing more complex scripts**.
#   - Delays (`sleep`) are useful for **progress displays and timed actions**.

# 🟢 HOW CAN STUDENTS APPLY THIS?
#   - Modify the script to **calculate cubes instead of squares**.
#   - Change `N` dynamically by **allowing user input**.
#   - Use `sleep` to **simulate progress updates in automation tasks**.

# 🚀 THIS SCRIPT BUILDS A FOUNDATION FOR AUTOMATING REPETITIVE TASKS IN BASH!
