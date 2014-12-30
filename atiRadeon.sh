#!/bin/bash

ATI=`aticonfig --odgt | grep -vi Default | awk '{print $5}'`

echo 'ati'$ATI'°C'
