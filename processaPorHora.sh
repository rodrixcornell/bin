#!/bin/bash
DATA=`/bin/date +%Y%m%d_%H%M%S`
DATA_FILTRO=`/bin/date +%d/%b`
touch $DATA_FILTRO-$1
cat $1 | grep '03/Sep' | awk -F": " '{ printf $2"\n"}' > $DATA_FILTRO-$1
HORARIOS="00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23"
echo "Hora/Total"
for h in $HORARIOS
do
    RESULT=$(grep $h $DATA_FILTRO_$1 | wc -l)
    echo $h"h; "$RESULT
done
