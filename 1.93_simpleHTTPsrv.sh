#!/bin/bash

# ==========================================
# SIMPLE HTTP SERVER USING BASH & NETCAT
# ==========================================
# This script creates a basic HTTP server that listens on a specified port
# and responds to incoming connections with a simple HTTP header.
# The server runs in an infinite loop and can be stopped using CTRL+C.

# ===========================
# HANDLING CTRL+C INTERRUPT
# ===========================
# The "trap" command sets up a signal handler that listens for specific signals.
# In this case, we handle the INT (interrupt) signal when the user presses CTRL+C.
trap ctrl_c INT  # Calls the "ctrl_c" function when an interrupt signal (CTRL+C) is received.

echo "To stop the script you have to use Ctrl+C ..."

# ===========================
# DEFINING HTTP RESPONSE HEADER
# ===========================
# This variable stores a basic HTTP response that will be sent to clients.
# The response includes:
# - HTTP status code (200 OK): Indicates that the request was successful.
# - Connection header (keep-alive): Keeps the connection open for further communication.
# - Server information (Simple Bash Server): Identifies the server.
# - Date: The current server date and time.
response="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nServer: Simple Bash Server\r\nDate: $(date)\r\n"

# ===========================
# USAGE FUNCTION
# ===========================
# This function displays the correct way to run the script.
# It helps users understand that they need to specify a port number when running the script.
usage () {
    echo "Usage: bash $0 [port]"
}

# ===========================
# FUNCTION TO HANDLE CTRL+C
# ===========================
# This function is triggered when the user presses CTRL+C.
# It allows for a clean shutdown of the server.
ctrl_c () {
    echo "Shutting down the server..."
    exit  # Exits the script gracefully.
}

# ===========================
# CHECKING IF A PORT NUMBER IS PROVIDED
# ===========================
# The script expects exactly one argument (the port number).
# If no argument is provided, the script will display usage instructions and exit.
if [ $# -ne 1 ]; then  # "$#" represents the number of arguments passed to the script.
    usage  # Call the usage function to show the correct way to run the script.
    exit  # Exit the script to prevent errors.

else
    echo "Server started on port $1"  # Inform the user that the server is running.

    # ===========================
    # STARTING THE SERVER
    # ===========================
    # This is an infinite loop that keeps the server running.
    # It listens for connections using Netcat (`nc`).
    # Whenever a request is received, it sends the predefined HTTP response.
    while true; do
        echo -e $response | nc -l -p $1  # Uses "nc" (netcat) to listen on the specified port.
    done
fi

# =======================================================
# WHAT STUDENTS LEARN FROM THIS SCRIPT
# =======================================================
# 1. How to create a basic HTTP server using Bash and Netcat (`nc`).
# 2. How HTTP responses work (status codes, headers, and response formatting).
# 3. How to use Bash scripting techniques like loops, variables, and functions.
# 4. How to handle command-line arguments (`$#` checks if a port number is provided).
# 5. How to use `trap` to handle system signals like CTRL+C for graceful shutdown.
# 6. How to continuously listen for incoming network connections using `nc -l -p [port]`.

# =======================================================
# WHY IS THIS USEFUL?
# =======================================================
# - Basic introduction to networking and HTTP protocols without using complex web servers.
# - Helps students understand how a server responds to client requests.
# - Useful for testing and debugging how web clients interact with servers.
# - Lays the groundwork for more advanced web server development.
