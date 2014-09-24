#!/bin/bash
   echo ""
   echo ""
      echo "Seja bem vindo!"
sleep 1
while :
do
clear
      echo "Escolha uma das seguintes opções:"
   echo ""
      echo "A - Soma"
      echo "B - Subtracção"
      echo "C - Multiplicação"
      echo "D - Divisão"
      echo "E - x^2"
      echo "F - x^3"
      echo "G - x^y"
      echo "H - Raíz Quadrada! ->Não deu certo, por favor me digam como"
      echo "M - Mostrar memórias"
   echo ""
   echo ""
      echo "L - Limpar consola"
      echo "S - Sair"
      echo "";read menu
      #-------------------------
       
if [ $menu = "A" ] || [ $menu = "a" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read soma1
      echo "Insira o 2º valor:";read soma2
   echo ""
   a=$[soma1+soma2]
      echo "$soma1 + $soma2 = $[soma1+soma2]"
      sleep 5
      echo ""
      echo "Adicionar resultado na memória? [S/N]";read memsoma
if [ $memsoma = "S" ] || [ $memsoma = "s" ]
then
   memoriaA=$a
   fi
else   
    
#----------------------------------------
if [ $menu = "B" ] || [ $menu = "b" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read sub1
      echo "Insira o 2º valor:";read sub2
   echo ""
   b=$[sub1-sub2]
      echo "$sub1 - $sub2 = $[sub1-sub2]"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [S/N]";read memsub
if [ $memsub = "S" ] || [ $memsub = "s" ]
then
   memoriaB=$b
   fi
else   
#----------------------------------------
if [ $menu = "C" ] || [ $menu = "c" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read mult1
      echo "Insira o 2º valor:";read mult2
   echo ""
   c=$[mult1*mult2]
      echo "$mult1 * $mult2 = $[mult1*mult2]"
      sleep 5
   echo ""      
      echo "Adicionar resultado na memória? [S/N]";read memmult
if [ $memmult = "S" ] || [ $memmult = "s" ]
then
   memoriaC=$c
   fi
else   
#----------------------------------------
if [ $menu = "D" ] || [ $menu = "d" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read div1
      echo "Insira o 2º valor:";read div2
   echo ""
   d=$[div1/div2]
      echo "$div1 / $div2 = $[div1/div2]"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [S/N]";read memdiv
if [ $memdiv = "S" ] || [ $memdiv = "s" ]
then
   memoriaD=$d
   fi
else
#-----------------------------------------
if [ $menu = "E" ] || [ $menu = "e" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read xq1
   echo ""
   e=$[xq1**2]
      echo "$xq1 ^ 2 = $e"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [S/N]";read memxq
if [ $memxq = "S" ] || [ $memxq = "s" ]
then
   memoriaE=$e
   fi
else
#------------------------------------------
if [ $menu = "F" ] || [ $menu = "f" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read xq2
   echo ""   
   f=$[xq2**3]
      echo "$xq2 ^ 3 = $f"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [S/N]";read memxq2
if [ $memxq2 = "S" ] || [ $memxq2 = "s" ]
then
   memoriaF=$f
   fi
else
#-------------------------------------------
if [ $menu = "G" ] || [ $menu = "g" ]
then
   echo ""
   echo ""
   echo ""
      echo "Insira o 1º valor:";read xy1
      echo "Insira o 2º valor:";read xy2
   echo ""
   g=$[xy1**xy2]
      echo "$xy1 ^ $xy2 = $g"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [S/N]";read memxy
if [ $memxy = "S" ] || [ $memxy = "s" ]
then
   memoriaG=$g
   fi
else
#---------------------------------------------
if [ $menu = "H" ] || [ $menu = "h" ]
then
   echo ""
   echo ""
   echo ""
    
      echo "Insira o valor:";read raiz
   echo ""
   #--->h=$[raiz**0.5]
      echo "A raiz quadrada de $raiz é" #--> #"$h"
      sleep 5
   echo ""
      echo "Adicionar resultado na memória? [ S/N]";read memraiz
if [ $memraiz = "S" ] || [ $memraiz = "s" ]
then
   memoriaH=$h
   fi
else
#----------------------------------------------
if [ $menu = "M" ] || [ $menu = "m" ]
then
   echo ""
   echo ""
   echo ""
      echo "Memória soma = $memoriaA"
      echo "Memória Subtracção = $memoriaB"
      echo "Memória Multiplicação = $memoriaC"
      echo "Memória Divisão = $memoriaD"
      echo "Memória x^2 = $memoriaE"
      echo "Memória x^3 = $memoriaF"
      echo "Memória x^y = $memoriaG"
      echo "memória raíz quadrada = $memoria H"
      sleep 5
else
#-----------------------------------------------
if [ $menu = "L" ] || [ $menu = "l" ]
then
      echo "Limpando..."
      sleep 2
else
#-----------------------------------------------
if [ $menu = "S" ] || [ $menu = "s" ]
then
      echo "Deseja mesmo sair? [S/N]";read sair
if [ $sair = "S" ] || [ $sair = "s" ]
then
   echo ""
   echo ""
   echo ""
      echo "Obrigado por testar esse meu passatempo!"
   sleep 1
      echo "Criado por:  Tainan Lucas R. Reis"
   sleep 2
   reset
exit
 
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
 
fi
done
