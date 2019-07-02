#!/usr/bin/env bash

echo "Hello World!!!";
echo "Proxy Off!!!";

export {https,http,ftp,socks,all}_proxy=""
export no_proxy="localhost,0.0.0.0,10.0.0.0/8,127.0.0.0/8,192.168.0.0/16"

sudo -E rm -rf /etc/apt/apt.conf

sudo -E rm -rf /etc/profile.d/proxy.sh
