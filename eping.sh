#!/bin/bash
#ELI MARQUES JUNIOR / eli.marquesjunior@gmail.com
#Rodrigo Cabral / rodrixcornell@gmail.com

function pinga_neles(){
    clear
    num=0
    DIR=$HOME/bin
    DIR_cria=$DIR/cria
    sudo ls >> /dev/null

    if [ -d "$DIR_cria/pingar" ] && [ -d "$DIR_cria/pingando" ];then
        rm $DIR/ARQ-final.txt
        rm $DIR/RELATORIO_$2.txt
       else
        mkdir -p $DIR_cria/pingar
        mkdir -p $DIR_cria/pingando
    fi

    for (( a=$3; a<=$4; a++ )); do
        echo "
             ping -c 2 $2.$a >> /dev/null
             x=\$?
             if [ \$x -eq 0 ]; then
                echo "$2.$a OK" >> $DIR_cria/ARQ$a.txt
                nmblookup -A $2.$a | egrep -i '(mac|<00>)'| grep -vi \<group\> | cut -d' ' -f1,2-4 >> $DIR_cria/ARQ$a.txt
                echo  " " >> $DIR_cria/ARQ$a.txt
               else
                echo $2.$a DOWN >> $DIR_cria/ARQ$a.txt
             fi

        " >> $DIR_cria/pingar/script.$num.sh
        num=`expr $num + 1`
    done

    cd $DIR_cria/pingar/
    count=`ls | wc -l`
    echo Total: $count
    echo -------------------------
    count0=0
    lock=20

    while [ $count0 -lt $count ]; do

        echo "Falta(m): `expr $count - $count0`"
        mv script.$count0.sh ../pingando/
        sh $DIR_cria/pingando/script.$count0.sh &
        count0=`expr $count0 + 1`

        if [ $count0 == $lock ]; then
            echo Lock: $lock
            tempo=\.
            segundos=1
            while (( $segundos <= 5)); do
            echo -en "\rAguarde $tempo `expr 5 - $segundos`"
            sleep 1
            tempo=$tempo\.
            ((segundos++))
                        if (( $segundos > 5 )); then
                             echo -e "\n"
                        fi
                    done
            lock=`expr 20 + $lock`
        fi
    done

    if [ $count0 == $count ]; then
            tempo=\.
            count=1
            while (( $count <= 10)); do
        echo -en "\rAguarde mais `expr 10 - $count` segundos $tempo"
        sleep 1
                tempo=$tempo\.
                ((count++))
            done

        cat $DIR_cria/ARQ*.txt >> $DIR/ARQ-final.txt
        rm $DIR_cria/ARQ*.txt

        clear
        echo "-------------------------------------------------------"
        rm ../pingando/script.*.sh
        grep -A 3 -i OK $DIR/ARQ-final.txt | grep -vi down >> $DIR/RELATORIO_$2.txt
        grep -i down $DIR/ARQ-final.txt | sort -h >> $DIR/RELATORIO_$2.txt
        rm  $DIR/ARQ-final.
        rm $DIR_cria
        more $DIR/RELATORIO_$2.txt
    fi
}

if [ -z "$1" ] || [ "$1" != "-p" ] && [[ "$1" != "-"* ]]; then
      echo "      $script -h for help"
fi

while getopts  ":hp:" opts; do
        script=`echo $0 | cut -d/ -f6`

    case $opts in
        h) echo "    $script -p \"rede\" \"inicio\" \"fim\""
               echo "    ex.: $script -p 10.196.3 1 254";;
        p) pinga_neles $1 $2 $3 $4;;
        :) echo "    Option -p requires an argument."
           exit 1;;
        *) echo "    $script -h for help"
           exit 1;;
    esac
done
