#!/bin/bash
check_user () {
id $1 >/dev/null 2>&1
if [ $? -eq 0 ]
then
echo " User exists "
else
echo " User do not exits "
fi
}
check_user root
