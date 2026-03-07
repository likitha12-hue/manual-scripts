#!/bin/bash
start_service () {
sudo systemctl stop $1
echo " $1 stopped running "
}
start_service httpd
