#!/bin/bash

for i in $(seq $1 $2)
do
	mv download.php?e="$i" Revista_PROGRAMAR_"$i".pdf
done
