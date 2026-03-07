#!/bin/bash
pid=`ps -ef | grep -v grep | grep -i httpd | awk 'NR == 1 { print $2 }' | wc -l `
if [ $pid == 1 ];
then
echo "HTTPD service is running"
else
echo "HTTPD service is down"
echo "Restart HTTPD serbice"
systemctl restart httpd
echo "HTTPS service is started"
fi

