#!/usr/bin/env bash

if [[ $# -eq 0 ]] then
	echo "Usage: $0 <0/1>"
	exit 0
fi

sudo sysctl -w net.ipv4.ip_forward=$1
