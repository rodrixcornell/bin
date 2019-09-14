#!/usr/bin/env bash

echo "Hello World!!!";
echo "Proxy Off!!!";

export {https,http,ftp,socks,all}_proxy=""
export no_proxy="localhost,10.0.0.0/8,127.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
unset {https,http,ftp,socks,all,no}_proxy

sudo -E rm -rf /etc/apt/apt.conf

sudo -E rm -rf /etc/profile.d/proxy.sh

