#!/bin/bash
install_package () {
sudo yum install -y $1
}
install_package wget
