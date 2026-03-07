#!/bin/bash
system_health_check () {
echo " System health checkup "
echo "----------------------------"
echo " Host name : $(hostname) "
echo " Uptime: $(uptime)"
echo "Memmory usage:"
free -h
echo "Disk usage:"
df -h
}
system_health_check
