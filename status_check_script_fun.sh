#!/bin/bash

pid=$(ps -ef | grep -v grep | grep -i httpd | awk 'NR==1 {print $2}' | wc -l)

static_web_page () {
    if [ -f /var/www/html/index.html ]; then
        echo "Index.html is available for launching the static website page"
    else
        echo "Index.html is not available for launching the static website page"
        echo "Adding Index.html page in /var/www/html location"
        cp -r /tmp/index.html /var/www/html/index.html
        echo "Index.html page is added in /var/www/html location"
    fi
}

if [ $pid -ge 1 ]; then
    echo "HTTPD service is running"
    echo "Verify Index.html is available in /var/www/html location"
    static_web_page
    echo "Verification is completed for running httpd service"
else
    echo "HTTPD service is down"
    echo "Restarting HTTPD service"
    systemctl restart httpd
    echo "HTTPD service started"
    echo "Verify Index.html is available in /var/www/html location"
    static_web_page
    echo "Verification is completed"
fi
