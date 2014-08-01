!#bin/bash
principal() {
clear
   echo -e "\t\t\t\tmenu principal\n"
   echo -e "\t[1] Para colocar um aporta na esculta: \n"
   echo -e "\t[2] Para scannear uma porta determinada:\n"
   echo -e "\t[3] Para monitorar um porta determinada[sniffer] :\n"
   echo -e "\t[4] sair\n"
   echo -e "\tEscolha[1/2/3/4]?"
   read confirma

case $confirma in
  1) esculta;;
  2) scanner;;
  3) monitorar;;
  4) sair;;
  *) echo 'opicao invalida!'&&sleep 2&&principal;;
esac
}

esculta () {
   echo -e "\tDigite o numero da porta em que deseja colocar na esculta:\n"
   read esculta
   echo `netcat -v -l -p $esculta`
}

scanner () {
   echo -e "\tDigite o ip: \n"
   read ip
   echo -e "\tColoque o primeiro numero de: \n"
   read porta
   echo -e "\tColoque o segundo numero $porta ha:\n"
   read porta2
   echo -e "\tcontinuar [enter]\n"
   read 
   echo -e `netcat -vv $ip $porta\-\$porta2`
}

monitorar () {
   echo -e "\tDigite o numero de ip que deseja monitorar:\n "
   read ip
   echo -e "\tDigie o numero da porta:\n"
   read porta
   echo `netcat -vv -l $ip -p $porta`
}

sair()
{
   echo -e "\t[enter] para sair"&&read&&exit
}
principal
