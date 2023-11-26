#!/bin/bash
cmd_path=$(dirname $0)
cd $cmd_path

sudo cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state

