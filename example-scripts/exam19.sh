#!/bin/bash
cleanup_logs () {
ls /var/log
logdir=$1
find $logdir -name "*.log" -mtime +7 -exec rm -f {} \;
echo " Old log files are deleted"
}
cleanup_logs /var/log
