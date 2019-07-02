#!/bin/bash

#echo $(ifconfig | grep -i bcast | cut -d" " -f13)
#echo $(ifconfig | grep -i bcast | sed 's/          //' | cut -d' ' -f3)
#echo $(ifconfig | grep -i bcast | column -tx | cut -d' ' -f5) | sed 's/\ /\ -\ /g'
#echo $(echo $(ifconfig | grep -i bcast | column -tx | cut -d' ' -f5) | sed 's/\ /,\ /g')
echo $(echo $(ip addr | grep -i inet | column -tx | cut -d' ' -f4) | sed 's/\ /,\ /g'), $(curl -# ifconfig.me/all.json | jq '.ip_addr' | sed 's/"//g')
#- $(ifconfig | grep -i P-a-P | column -tx | cut -d' ' -f5)
