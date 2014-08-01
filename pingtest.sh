#!/bin/bash

if ping -c 1 -W 2 pitua > /dev/null; then
	resp1="Pitua Up"
else
	resp1="Pitua Down"
fi

if ping -c 1 -W 2 proxy > /dev/null; then
	resp2="Proxy Up"
else
	resp2="Proxy Down"
fi

echo ${resp1} \| ${resp2}