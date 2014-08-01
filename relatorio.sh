#!/bin/sh
# Script originalmente postado pelo Fripp_King no f�rum
# modificado por Carlos E. Morimoto

if [ "$1" != "-s" ];
then 

xdialog --msgbox "Este script gera um relat�rio contendo a configura��o de hardware e rede do seu micro e o conte�do dos principais arquivos de configura��o da sua instala��o do Kurumin.
Estas informa��es s�o essenciais para que outras pessoas possam localizar e ajud�-lo a corrigir problemas que aparecerem com o uso.
Ao postar uma mensagem no f�rum de suporte do Kurumin pedindo ajuda, n�o se esque�a de incluir este relat�rio, caso contr�rio fica muito dif�cil tirar qualquer conclus�o e voc� vai acabar n�o recebendo ajuda.
Voc� pode copiar e colar o texto na mensagem pressionando Ctrl+C (para copiar) e Ctrl+V (para colar), como no Windows."

fi 


rm -f /tmp/relatorio.txt
sudo rm -f /tmp/relatorio.txt
rm -f /tmp/relatorio2.txt
sudo rm -f /tmp/relatorio2.txt
touch /tmp/relatorio.txt
sudo touch /etc/kurumin_version 
chmod 666 /tmp/relatorio.txt

echo "Vers�o do Kurumin:" >> /tmp/relatorio.txt  
cat /etc/kurumin_version >> /tmp/relatorio.txt 
uname -r >> /tmp/relatorio.txt
echo " " >> /tmp/relatorio.txt

echo "----dmesg----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
tail -n 10 /var/log/dmesg >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----fdisk----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo fdisk -l >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----lspci----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
lspci >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----lsmod----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
lsmod >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----lsusb----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
lsusb >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----ifconfig----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
ifconfig >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----route----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
route  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----hostname----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
cat /etc/hostname  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----resolv.conf----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
cat /etc/resolv.conf  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----hosts----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
cat /etc/hosts  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----iptables----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo iptables -L  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----iptables_nat---" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo iptables -t nat -L  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----ignora_ping---" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo cat /proc/sys/net/ipv4/icmp_echo_ignore_all  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----ip_forward---" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo cat /proc/sys/net/ipv4/ip_forward  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----netstat----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo netstat -a | grep tcp  >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----hda----" >> /tmp/relatorio.txt
sudo hdparm -i /dev/sda   >> /tmp/relatorio.txt
echo "----hdb----" >> /tmp/relatorio.txt
sudo hdparm -i /dev/sdb   >> /tmp/relatorio.txt
echo "----hdc----" >> /tmp/relatorio.txt
sudo hdparm -i /dev/sdc   >> /tmp/relatorio.txt
echo "----hdd----" >> /tmp/relatorio.txt
sudo hdparm -i /dev/sdd   >> /tmp/relatorio.txt

echo " "  >> /tmp/relatorio.txt
echo "----fstab----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo cat /etc/fstab  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----lilo----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo cat /etc/lilo.conf  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----who----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo who -a  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----syslog----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo tail -10 /var/log/syslog  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----messages----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo tail -10 /var/log/messages  >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
echo "----fim----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----df----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo df >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----free----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo free >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----mount----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
sudo mount >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----X11----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
cat /etc/X11/XF86Config-4 >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----rcS.d----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
ls /etc/rcS.d >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

echo "----rc5.d----" >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt
ls /etc/rc5.d >> /tmp/relatorio.txt
echo " "  >> /tmp/relatorio.txt

sed '/#/d' /tmp/relatorio.txt >> /tmp/relatorio2.txt
rm -f /tmp/relatorio.txt
sudo rm -f /tmp/relatorio.txt
cat -s /tmp/relatorio2.txt >> /tmp/relatorio.txt


if [ "$1" != "-s" ];
then 

gedit /tmp/relatorio.txt 

fi 

