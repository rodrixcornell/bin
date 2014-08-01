#!/bin/bash
################################################################################

arrayPPA=( "ppa:nilarimogard/webupd8" "ppa:rye/ubuntuone-extras" "ppa:tsbarnes/indicator-keylock" "ppa:tualatrix/ppa" "ppa:ubuntu-mozilla-daily/ppa" "ppa:ubuntu-mozilla-security/ppa" "ppa:ubuntu-wine/ppa" "ppa:webupd8team/java" "ppa:pidgin-developers/ppa" );
x=0;
echo "########################################"
while [ $x != ${#arrayPPA[@]} ]
do
	echo "Prepositório "${arrayPPA[$x]}" único digito"
	sudo add-apt-repository ${arrayPPA[$x]}
	echo ""
	let "x = x +1"
done
