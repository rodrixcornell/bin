#!/bin/bash
data=`/bin/date +%Y%m%d`
machine=`/bin/uname -m`
release=`/bin/uname -r`

os=`cat /proc/version |awk '{print $4"-"$5}'`

origin=${HOSTNAME}_${machine}_${data}

echo $origin
