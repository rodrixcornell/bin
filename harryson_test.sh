#!/bin/bash

echo "Hello World";

xterm -e firefox &

xterm -e 'php -sS localhost:9000 -t ~/public_html/' 2> /dev/null &

cd ~/public_html/semad/
