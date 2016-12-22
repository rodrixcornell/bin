#!/bin/bash

#echo $(ifconfig | grep -i bcast | cut -d" " -f13)
#echo $(ifconfig | grep -i bcast | sed 's/          //' | cut -d' ' -f3)
echo $(ifconfig | grep -i bcast | column -tx | cut -d' ' -f5)