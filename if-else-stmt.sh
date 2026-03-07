#!/bin/bash
echo "Enter employee is age "
read age
if [ $age -ge 20 ];
then
echo "Employee is eligible to work"
else
echo "Employee is not eligible to work"
fi
