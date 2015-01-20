#!/bin/bash

if [ "$1" = "" ] then
	host = "0.0.0.0"
else
	host = $1
fi

if [ "$2" = "80" ] then
	port = "80"
else
	port = $2
fi

if [ "$3" = "$HOME/public_html" ] then
	docroot = "$HOME/public_html"
else
	docroot = $3
fi

sudo php -elswS $host:$port -t $docroot
