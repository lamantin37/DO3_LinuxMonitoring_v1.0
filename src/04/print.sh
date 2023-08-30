#!/bin/bash

declare -A system_info
system_info=(
    [HOSTNAME]=$(hostname)
    [TIMEZONE]=$(timedatectl | grep Moscow | awk '{print $3 $4 $5}')
    [USER]=$USER
    [OS]=$(cat /etc/issue | sed -r '/^\s*$/d' | awk '{print $1,$2,$3}')
    [DATE]=$(date +"%d %b %Y %T")
    [UPTIME]=$(uptime -p | cut -d ' ' -f 2-)
    [UPTIME_SEC]=$(cut -d ' ' -f 1 /proc/uptime)
    [IP]=$(hostname -I)
    [MASK]=$(ifconfig lo | grep netmask | awk '{print $4}')
    [GATEWAY]=$(ip r | grep default | awk '{print $3}')
    [RAM_TOTAL]=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $2/1024}')
    [RAM_USED]=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $3/1024}')
    [RAM_FREE]=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $4/1024}')
    [SPACE_ROOT]=$(df /root/ | awk '/\/$/{printf "%.2fMB\n", $2/1024}')
    [SPACE_ROOT_USED]=$(df /root/ | awk '/\/$/{printf "%.2fMB\n", $3/1024}')
    [SPACE_ROOT_FREE]=$(df /root/ | awk '/\/$/{printf "%.2fMB\n", $4/1024}')
)

for key in "${!system_info[@]}"; do
    export "$key"="${system_info[$key]}"
done
