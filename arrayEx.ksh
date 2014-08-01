#!/bin/ksh
#-----------------------------------------------------
#  Arquivo:       arrayEx.ksh
#  Descricao:     Exemplo de utilizacao de arrays
#                 em Korn Shell
#  Autor:         Vinícius Parizatto
#----------------------------------------------------

set -A nomes "Bit" "Nibble" "Byte" "Word" "Double Word"
set -A valores 1 4 8 16 32
x=0;
echo 
"########################################"
while [ $x != ${#nomes[@]} ]
do
   if [ $x == 0 ]
   then
      echo "A menor \"unidade\" de dados binários "
      echo "tem o nome de "${nomes[$x]}"."
      echo "Ele representa "${valores[$x]}" único digito"
      echo ""
   else
      echo "* "${nomes[$x]}" é o conjunto de "${valores[$x]}" bits."
   fi
   let "x = x +1"
done
echo "########################################"
