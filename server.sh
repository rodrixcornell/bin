#!/bin/bash

if [ "$2" = "80" ]; then
	port = "80"
else
	port = "8080"
fi

if [ "$3" = "$HOME/public_html" ]; then
	docroot = "$HOME/public_html"
else
	docroot = $3
fi

if [ "$1" = "" ]; then
	host = "0.0.0.0"
	echo "sudo php -elswS $host:$port -t $docroot"
	echo $host:$port $docroot
else
	host = "localhost"
	echo "php -elswS $host:$port -t $docroot"
	echo $host:$port $docroot
fi
