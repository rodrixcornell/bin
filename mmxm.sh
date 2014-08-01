#!/bin/bash 
# Script para automatizar algumas funções V0.1 
#Criado por MMxM 
#Visitem !!! http://www.clubedoprogramador.com.br/forum/forum.php 
##############################  
## CLUBE DO PROGRAMADOR### 
############################## 

main(){ 
clear 
echo 
echo "Script Criado por MMxM" 
echo 
echo 
echo 
echo "O que deseja ?" 
echo "Opções:" 
echo "1 - Ver informações sobre o computador" 
echo "2 - Ver informações sobre a mémoria" 
echo "3 - Instalar pacotes .deb " 
echo "4 - ver processos em execução" 
echo "5 - matar um processo" 
echo "6 - Descompactar zip-rar-tar-tar.gz-tar.bz2" 
echo "7 - Sair" 
echo ;read whx 


        if [ $whx = "1" ]  
            then 
            clear 
            info_cpu 
        elif [ $whx = "2" ] 
            then 
            clear 
            info_memoria 
        elif [ $whx = "3" ] 
            then 
            clear 
            instalador 
        elif [ $whx = "4" ] 
            then 
            clear 
            processos 
        elif [ $whx = "5" ] 
            then 
            clear 
            terminar 
        elif [ $whx = "6" ] 
            then 
            clear 
            Desempacotador 
        elif [ $whx = "7" ] 
            then 
            clear 
            echo 
            echo 
            echo 
            echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
            echo 
            echo 
            echo 
            exit 0; 
        else 
            clear 
            echo 
            echo 
            echo 
            echo -e "\033[41;1;37mopção invalida\033[0m" 
            sleep 2 
            main 
fi 
} 
info_cpu(){ 
clear 
echo -e "\033[1;37mInformações da CPU:\033[0m" 
sleep 2 
echo 
echo 
cat /proc/cpuinfo 
echo 
echo "Deseja continuar usando o script ? s/n" ;read resposta 
if [ $resposta = "s" ] 
    then 
    clear 
    main 
elif [ $resposta = "n" ] 
    then 
    clear 
    echo  
    echo 
    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
    echo 
    echo 
    exit 0; 
else  
    echo 
    echo -e "\033[41;1;37mopção invalida\033[0m" 
    echo 
    sleep 2 
    clear 
    info_cpu 
fi 
} 
info_memoria(){ 
clear 
echo -e "\033[1;37mInformações sobre a memoria do computador:\033[0m" 
sleep 2 
echo 
echo 
cat /proc/meminfo 
echo 
echo "Deseja continuar usando o script ? s/n" ;read resposta 
if [ $resposta = "s" ] 
    then 
    clear 
    main 
elif [ $resposta = "n" ] 
    then 
    clear 
    echo  
    echo 
    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
    echo 
    echo 
    exit 0; 
else  
    echo 
    echo -e "\033[41;1;37mopção invalida\033[0m" 
    echo 
    sleep 2 
    clear 
    info_memoria 
fi 
} 
instalador(){ 
clear 
echo 
echo 
echo "Deseja Instalar um pacote .deb ? s/n" 
echo ;read ss 
    if [ $ss = "s" ] 
        then 
            echo 
            echo 
            echo "Digite onde o pacote .deb se encontra" 
            echo "Exe: /home/$USER/Desktop/pacote.deb" 
            echo 
            echo ;read deb 
            sudo dpkg -i $deb 
            echo 
            echo "Pacote $deb Instalado com sucesso !!!" 
            echo  
            echo "Deseja continuar usando o script ? s/n" 
            echo 
            echo ;read sn 
            if [ $sn = "s" ] 
                then 
                clear 
                main 
            elif [ $sn = "n" ] 
                then 
                clear 
                echo 
                echo 
                echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                echo 
                echo 
                echo 
            else 
                echo -e "\033[41;1;37mopção invalida\033[0m" 
                sleep 2 
                instalador 
fi 
    elif [ $ss = "n" ] 
        then  
        clear 
        main 
    else 
        echo  
        echo 
        echo -e "\033[41;1;37mopção invalida\033[0m" 
        echo 
        sleep 2 
        instalador 
fi 
} 
processos(){ 
clear 
echo 
echo 
echo -e "\033[1;37mProcessos em execução:\033[0m" 
echo 
echo 
sleep 2 
ps aux 
echo 
echo 
echo "Deseja continuar usando o script ? s/n" ;read resposta 
if [ $resposta = "s" ] 
    then 
    clear 
    main 
elif [ $resposta = "n" ] 
    then 
    clear 
    echo  
    echo 
    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
    echo 
    echo 
    exit 0; 
else  
    echo 
    echo -e "\033[41;1;37mopção invalida\033[0m" 
    echo 
    sleep 2 
    clear 
    processos 
fi 
} 
terminar(){ 
clear 
echo 
echo 
echo "Digite o nome do processo que deseja terminar:" ;read processo 
killall $processo 
echo "$processo Terminado com sucesso" 
echo 
echo 
echo "Deseja continuar usando o script ? s/n" ;read resposta 
if [ $resposta = "s" ] 
    then 
    clear 
    main 
elif [ $resposta = "n" ] 
    then 
    clear 
    echo  
    echo 
    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
    echo 
    echo 
    exit 0; 
else  
    echo 
    echo -e "\033[41;1;37mopção invalida\033[0m" 
    echo 
    sleep 2 
    clear 
    terminar 
fi 
} 
Desempacotador(){ 
    clear 
    echo  
    echo 
    echo "Digite o tipo de pacote que deseja extrair" 
    echo "Exe: zip,rar,tar,tar.gz,tar.bz2" 
    echo "Digite sair para voltar" 
    echo 
    echo ;read pacote 
    if [ $pacote = "zip" ] 
        then 
            echo "Digite onde o arquivo zip se encontra " 
            echo "Exe: /home/$USER/Desktop/pacote.zip" 
            echo 
            echo  ;read arquivo 
            unzip $arquivo 
            echo "$arquivo descompactado com sucesso" 
            echo "Deseja continuar ? s/n" 
            echo ;read continuar 
                if [ $continuar = "s" ] 
                    then 
                    clear 
                    Desempacotador 
                elif [ $continuar = "n" ] 
                    then 
                    clear 
                    echo 
                    echo 
                    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                    echo 
                    echo 
                    exit 0; 
                else 
                    echo -e "\033[41;1;37mopção invalida\033[0m" 
                    sleep 2 
                    clear 
                    Desempacotador 
fi 
    elif [ $pacote = "rar" ] 
        then 
            echo "Digite onde o arquivo rar se encontra " 
            echo "Exe: /home/$USER/Desktop/pacote.rar" 
            echo 
            echo  ;read arquivo 
            unrar x $arquivo 
            echo "$arquivo descompactado com sucesso" 
            echo "Deseja continuar ? s/n" 
            echo ;read continuar 
                if [ $continuar = "s" ] 
                    then 
                    clear 
                    Desempacotador 
                elif [ $continuar = "n" ] 
                    then 
                    clear 
                    echo 
                    echo 
                    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                    echo 
                    echo 
                    exit 0; 

                else 
                    echo -e "\033[41;1;37mopção invalida\033[0m" 
                    sleep 2 
                    clear 
                    Desempacotador 
fi 
    elif [ $pacote = "tar" ] 
        then 
            echo "Digite onde o arquivo tar se encontra " 
            echo "Exe: /home/$USER/Desktop/pacote.tar" 
            echo 
            echo  ;read arquivo 
            tar -xvf $arquivo 
            echo "$arquivo descompactado com sucesso" 
            echo "Deseja continuar ? s/n" 
            echo ;read continuar 
                if [ $continuar = "s" ] 
                    then 
                    clear 
                    Desempacotador 
                elif [ $continuar = "n" ] 
                    then 
                    clear 
                    echo 
                    echo 
                    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                    echo 
                    echo 
                    exit 0; 
                else 
                    echo -e "\033[41;1;37mopção invalida\033[0m" 
                    sleep 2 
                    clear 
                    Desempacotador 
fi 
    elif [ $pacote = "tar.gz" ] 
        then 
            echo "Digite onde o arquivo tar.gz se encontra " 
            echo "Exe: /home/$USER/Desktop/pacote.tar.gz" 
            echo 
            echo  ;read arquivo 
            tar -vzxf $arquivo 
            echo "$arquivo descompactado com sucesso" 
            echo "Deseja continuar ? s/n" 
            echo ;read continuar 
                if [ $continuar = "s" ] 
                    then 
                    clear 
                    Desempacotador 
                elif [ $continuar = "n" ] 
                    then 
                    clear 
                    echo 
                    echo 
                    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                    echo 
                    echo 
                    exit 0; 
                else 
                    echo -e "\033[41;1;37mopção invalida\033[0m" 
                    sleep 2 
                    clear 
                    Desempacotador 
fi 
    elif [ $pacote = "tar.bz2" ] 
        then 
            echo "Digite onde o arquivo tar.bz2 se encontra " 
            echo "Exe: /home/$USER/Desktop/pacote.tar.bz2" 
            echo 
            echo  ;read arquivo 
            tar -jxvf $arquivo 
            echo "$arquivo descompactado com sucesso" 
            echo "Deseja continuar ? s/n" 
            echo ;read continuar 
                if [ $continuar = "s" ] 
                    then 
                    clear 
                    Desempacotador 
                elif [ $continuar = "n" ] 
                    then 
                    clear 
                    echo 
                    echo 
                    echo -e "\033[1;36m Visitem: http://www.clubedoprogramador.com.br/forum/forum.php \033[0m" 
                    echo 
                    echo 
                    exit 0; 
                else 
                    echo -e "\033[41;1;37mopção invalida\033[0m" 
                    sleep 2 
                    clear 
                    Desempacotador 
fi 
    elif [ $pacote = "sair" ] 
        then         
        clear 
        main 
    else  
        echo -e "\033[41;1;37mopção invalida\033[0m" 
        sleep 2 
        clear 
        Desempacotador 
fi 
} 
main;  
