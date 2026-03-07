#!/bin/bash
echo "Install httpd package"
yum install httpd -y
echo "Switch to directory /var/www/html and create an index.html"
cd /var/www/html
echo "<H1> Static web application </H1>" > index.html
echo "<H1> Linux OS HTTPD service </H1>" >> index.html
echo "Enable and start HTTPD service"
systemctl enable httpd
systemctl start httpd
echo "Check the status HTTPD service"
systemctl status httpd
