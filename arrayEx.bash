#!/bin/bash
#-----------------------------------------------------
#  Arquivo:       arrayEx.bash
#  Descricao:     Exemplo de utilizacao de arrays
#                 em GNU Bourne-Again SHell
#  Autor:         Vinícius Parizatto
#----------------------------------------------------



nomes=( "Bit" "Nibble" "Byte" "Word" "Double Word")
valores=( 1 4 8 16 32)
x=0;
echo "########################################"
while [ $x != ${#nomes[@]} ]
do
   if [ $x == 0 ]
   then
      echo "A menor \"unidade\" de dados binários "
      echo "tem o nome de "${nomes[$x]}"."
      echo "Ele representa "${valores[$x]}" único digito"
      echo ""
   else
      echo "1 "${nomes[$x]}" é o conjunto de "${valores[$x]}" bits."
   fi
   let "x = x +1"
done 
   echo "("${nomes[@]:2}")"
   echo "são os conjuntos de bits"
   echo "("${nomes[@]:1:3}")"
   echo "são os conjuntos menores que 32 bits"
echo "########################################"
