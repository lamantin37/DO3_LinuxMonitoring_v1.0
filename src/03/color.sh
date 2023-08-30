#!/bin/bash

white_background="\e[107m"
red_background="\e[101m"
green_background="\e[102m"
blue_background="\e[104m"
purple_background="\e[105m"
black_background="\e[40m"

white_text="\e[97m"
red_text="\e[91m"
green_text="\e[92m"
blue_text="\e[94m"
purple_text="\e[95m"
black_text="\e[30m"

end="\e[0m"

declare -A colors
colors=(
    [0]="$white_background" [1]="$red_background" [2]="$green_background"
    [3]="$blue_background" [4]="$purple_background" [5]="$black_background"
)

text_colors=(
    [0]="$white_text" [1]="$red_text" [2]="$green_text"
    [3]="$blue_text" [4]="$purple_text" [5]="$black_text"
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
