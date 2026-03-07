#!/bin/bash

check_service() {
    service=$1
    systemctl is-active $service >/dev/null 2>&1

    if [ $? -eq 0 ]
    then
        echo "$service is running"
    else
        echo "$service is not running"
    fi
}

check_service sshd
