#!/bin/bash
system_info () {
echo " Hostname is : $(hostname) "
echo " Kernel version: $(uname -r) "
echo " Uptime : $(uptime) "
}
system_info
