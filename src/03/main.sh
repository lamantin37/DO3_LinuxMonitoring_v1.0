#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Error: Number of arguments should be 4, no more, no less"
    exit 1
elif [[ $1 != [1-6] || $2 != [1-6] || $3 != [1-6] || $4 != [1-6] ]]; then
    echo "Error: Arguments can take values from 1 to 6"
    exit 1
elif [[ $1 == $2 || $3 == $4 ]]; then
    echo "Error: Background and text colors cannot be the same"
    exit 1
else
    source print.sh
    source color.sh
fi
