#!/bin/bash
create_project () {
mkdir $1
touch $1/file11.txt
touch $1/file2.txt
echo " Project created "
}
create_project myproject
