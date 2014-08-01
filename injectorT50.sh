#!/bin/bash

if [ -z "$1" ]; then
    echo "IP?"
    echo "Ex.: 172.19.10.1"
else
	sudo t50 $1 --flood --turbo --dport 80 53 443 12345 -S
fi