#!/bin/bash
version="2.0"

green=`tput setaf 2`
bold=`tput bold`
reset=`tput sgr0`

current_user=`whoami`
all_users=`cut -d: -f1 /etc/passwd`
echo "${all_users//$current_user/${green}${bold}*$current_user${reset}}"
