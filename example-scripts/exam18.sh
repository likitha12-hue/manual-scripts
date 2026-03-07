#!/bin/bash
create_user () {
id $1 >/dev/null 2>&1
if [ $1?-eq 0 ] 
then
echo "User already exixtes "
else
sudo useradd $1
sudo passwd $2
echo "User added : $1"
echo "Password is given to user: $2"
fi
}
create_user john 1234
