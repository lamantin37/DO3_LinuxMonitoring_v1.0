#!/bin/bash

if [ $# -ne 0 ]; then
    echo "Error: This script does not accept any arguments."
else
    chmod 777 print.sh
    ./print.sh

    read -rp "Do you want to write the output to a log file? (Y/N): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        name="$(date +"%d_%m_%y_%H_%M_%S").status"
        ./print.sh > "$name"
    fi
fi
