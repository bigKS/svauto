#! /bin/bash

# $1 = name
setMotdIssue() {
	figlet -f slant $1 > /etc/motd
	figlet -f slant $1 | sed -e 's/\\/\\\\/g' > /etc/issue
}

if [ -s "/usr/local/sandvine/etc/versions/TSE" ]; then
	setMotdIssue "Sandvine - TSE"
fi
