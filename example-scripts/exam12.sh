#!/bin/bash
backup () {
tar -czvf backup.tar.gz $1
echo " Backup created "
}
backup exam1.sh
