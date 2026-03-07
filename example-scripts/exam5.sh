#!/bin/bash
check_directory () {
if [ -d $1 ] 
then
echo " Directory $1 exists "
else
echo " Directory $1 do not exist "
fi
}
check_directory example-scripts
