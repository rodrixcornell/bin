#!/bin/bash

MACHINE=`/bin/uname -m`
if [ $MACHINE == "x86_64" ]
then
	 echo 'x86_64'
else
	 echo 'outro'
fi
