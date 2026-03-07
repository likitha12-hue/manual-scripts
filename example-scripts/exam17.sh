#!/bin/bash
check_service () {
systemctl is-active $1 >/dev/null 2>&1
if [ $? -ne 0 ]
then
echo " $1 is not running.. Starting service.... "
sudo systemctl start $1
else
echo " $1 is running.... "
fi
}
check_service sshd
