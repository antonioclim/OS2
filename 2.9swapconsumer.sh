#!/bin/bash
# WARNING: This script will aggressively consume RAM! 🛑
# Run with caution, and monitor system resources.

# Declare a large global array
declare -a num_array

# Track the index
index=0

echo "Starting memory consumption... Press Ctrl+C to stop."

while true; do
    # Fill array with large random numbers
    for ((i=0; i<500000; i++)); do
        num_array[index]="$RANDOM$RANDOM$RANDOM$RANDOM"
        ((index++))
    done

    # Print current memory usage
    echo "Memory usage: ${#num_array[@]} elements stored."
    
    # Short delay before consuming more RAM
    sleep 1
done

