#!/bin/bash
echo "Enter employee age"
read age
if [ $age -ge 20 ];
then
echo "Employee is eligible to work"
fi
