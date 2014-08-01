#!/bin/bash

echo "$1"
wget -c -O Revista_PROGRAMAR_"$1".pdf www.portugal-a-programar.pt/revista-programar/edicoes/download.php?e="$1"&t=site
