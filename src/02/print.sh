#!/bin/bash

timedatectl set-timezone Europe/Moscow
echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(timedatectl | awk '/Moscow/{print $3,$4,$5}')"
echo "USER = $USER"
echo "OS = $(cat /etc/issue | awk '{print $1,$2,$3}' | grep -v '^$')"
echo "DATE = $(date +"%d %b %Y %T")"
echo "UPTIME = $(uptime -p | cut -d ' ' -f 2-)"
echo "UPTIME_SEC = $(cut -d ' ' -f 1 /proc/uptime)"
echo "IP = $(hostname -I)"
echo "MASK = $(ifconfig lo | awk '/netmask/{print $4}')"
echo "GATEWAY = $(ip r | awk '/default/{print $3}')"
echo "RAM_TOTAL = $(free -m | awk '/Mem:/{printf "%.3fGb\n", $2/1024}')"
echo "RAM_USED = $(free -m | awk '/Mem:/{printf "%.3fGb\n", $3/1024}')"
echo "RAM_FREE = $(free -m | awk '/Mem:/{printf "%.3fGb\n", $4/1024}')"
echo "SPACE_ROOT = $(df /root/ | awk '/\/$/{printf "%.2fMB\n", $2/1024}')"
echo "SPACE_ROOT_USED = $(df /root/ | awk '/\/$/{printf "%.2fMB\n", $3/1024}')"
echo "SPACE_ROOT_FREE = $(df /root/ | awk '/\/$/{printf "%.2fMB\n", $4/1024}')"
