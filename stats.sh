#!/bin/bash
cmd_path=$(dirname $0)
cd $cmd_path

temp=`i2cget -y 1 0x57 0X04`
temp="$((temp-40))"
printf "Power: %dC, " $temp

percentage=`i2cget -y 1 0x57 0x2A`
printf "%d%%, " $percentage

voltage_high=`i2cget -y 1 0x57 0x22`
voltage_low=`i2cget -y 1 0x57 0x23`
voltage="$((voltage_high<<8))"
voltage="$((voltage+voltage_low))"
voltage=`bc <<< "scale=3; $voltage/1000"`
printf "%.3fV\n" $voltage

cpu_temp=`sensors -j | python3 -c 'import json;import sys;print(json.loads(sys.stdin.read())["cpu_thermal-virtual-0"]["temp1"]["temp1_input"])'`
printf "CPU: %.2fC, " $cpu_temp

cpu_usage=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`
printf "%.2f%%\n" $cpu_usage

free -m | awk 'NR==2{printf "Memory: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "Disk: %d/%dGB (%s)\n", $3,$2,$5}'

