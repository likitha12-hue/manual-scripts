#!/bin/bash
install_git () {
sudo yum install git -y
}
check_git_version () {
git --version
}
config_git () {
git config --global user.name "Likitha"
git config --global user.email "likitharayapudi0@gmail.com"
}
show_git_config () {
git config --list
}
install_git
check_git_version
config_git
show_git_config

