#!/bin/bash

re='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# -eq 0 ]; then
    echo "Error: Not enough arguments."
elif [[ $1 =~ $re ]]; then
    echo "Entered a number."
elif [ $# -gt 1 ]; then
    echo "Error: Too many arguments."
else
    echo "$1"
fi