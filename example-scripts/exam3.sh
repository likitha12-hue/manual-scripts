#/bin/bash
check_file() {
if [ -f $1 ]
then
echo "  File exists"
else
echo " File donot exist"
fi
}
check_file exam3.sh  
