#!/bin/bash

for i in $(seq $1 $2)
do
	wget -c -O Revista_PROGRAMAR_"$i".pdf www.portugal-a-programar.pt/revista-programar/edicoes/download.php?e="$i"&t=site
done
