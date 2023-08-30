#!/bin/bash

source color.conf

declare -A colors
colors=(
    [1]=$white_background [2]=$red_background [3]=$green_background
    [4]=$blue_background [5]=$purple_background [6]=$black_background
)
text_colors=(
    [1]=$white_text [2]=$red_text [3]=$green_text
    [4]=$blue_text [5]=$purple_text [6]=$black_text
)

for i in 0 2; do
    r_mass[$i]=${colors[${mass[$i]}]}
done

for i in 1 3; do
    r_mass[$i]=${text_colors[${mass[$i]}]}
done

declare -A color_names
color_names=(
    [1]="white" [2]="(red)" [3]="(green)"
    [4]="(blue)" [5]="(purple)" [6]="(black)"
)

for i in 0 1 2 3; do
    color[$i]=${color_names[${mass[$i]}]}
done
