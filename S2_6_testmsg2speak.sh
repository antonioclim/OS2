#!/bin/bash

# Function to check if a package is installed
check_and_install() {
    if ! command -v "$1" &> /dev/null; then  # Check if the command exists
        echo "$1 is not installed. Installing..."
        sudo apt update && sudo apt install -y "$1"
    fi
}

# Check and install mpg123 (used for playing MP3 files)
check_and_install "mpg123"

# Define the text to be converted to speech
TEXT="Hello students, this is a test for voice. Smile now or cry later!"
LANG="en-gb"

# Use Google TTS API to generate speech and save it as an MP3 file
wget -q -U "Mozilla" -O /tmp/speech.mp3 "https://translate.google.com/translate_tts?ie=UTF-8&tl=$LANG&client=tw-ob&q=$TEXT"

# Play the generated MP3 file
mpg123 /tmp/speech.mp3
