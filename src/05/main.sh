#!/bin/bash

export START=$(date +%s%N)

if [ $# -ne 1 ]; then
    echo "Error: Provide exactly one argument (directory path)"
    exit 1
fi

if [ "${1: -1}" != "/" ]; then 
    echo "Error: Directory path should end with a slash"
    exit 1
fi

export number_folders=$(sudo find "$1" -type d | wc -l)
export big_folders=$(sudo du -Sh "$1" | sort -rh | head -5 | awk '{print NR " - " $2 ", " $1}')
export number_files=$(sudo find "$1" -type f | wc -l)
export conf_number_files=$(sudo find "$1" -type f -name "*.conf" | wc -l)
export exe_number_files=$(sudo find "$1" -type f -executable -exec du -h {} + | wc -l)
export txt_number_files=$(sudo find "$1" -type f -name "*.txt" | wc -l)
export log_number_files=$(sudo find "$1" -type f -name "*.log" | wc -l)
export archive_number_files=$(sudo find "$1" -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l)
export link_number_files=$(sudo find "$1" -type l | wc -l)
export big_files=$(sudo find "$1" -type f -exec du -Sh {} + | sort -rh | head -10 | awk '{print NR " - " $2 ", " $1}')
export big_exe_files=$(sudo find "$1" -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print NR " - " $2 ", " $1}')
chmod 777 print.sh
./print.sh

END=$(date +%s%N)
DIFF=$(((END - START) / 1000000))
echo "Script execution time (in milliseconds) = $DIFF"
