#!/bin/bash
check_service () {
systemctl is-active $1
if [ $? -eq 0 ] 
then 
echo " Servise $1 is running "
else 
echo " Service $1 is not running "
fi 
}
check_service sshd
