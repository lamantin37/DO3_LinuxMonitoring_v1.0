#!/bin/bash

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

declare -A labels
labels=(
    [HOSTNAME]="Hostname" [TIMEZONE]="Timezone" [USER]="User"
    [OS]="Operating System" [DATE]="Date" [UPTIME]="Uptime"
    [UPTIME_SEC]="Uptime Seconds" [IP]="IP Address"
    [MASK]="Subnet Mask" [GATEWAY]="Gateway"
    [RAM_TOTAL]="Total RAM" [RAM_USED]="Used RAM"
    [RAM_FREE]="Free RAM" [SPACE_ROOT]="Root Space"
    [SPACE_ROOT_USED]="Used Root Space" [SPACE_ROOT_FREE]="Free Root Space"
)

for key in "${!labels[@]}"; do
    echo -e "${r_mass[0]}${r_mass[1]}${labels[$key]}$end = ${r_mass[2]}${r_mass[3]}${!key}$end"
done
