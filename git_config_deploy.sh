#!/bin/bash

PROJETO=$1

#  1- Desabilitar todas as alterações do branch atual
git checkout -f
git checkout develop

# Criando branch remote para deploy
echo "### ADICIONANDO BRANCHS REMOTOS"
git remote add develop deploy@daraa:~/repositories/${PROJETO}_web # DEV
git remote add ratify deploy@cruxati:~/repositories/${PROJETO}_web # HOM
git remote add master#1 deploy@liberdade:~/repositories/${PROJETO}_web #PROD1
git remote add master#2 deploy@apuau:~/repositories/${PROJETO}_web #PROD2

echo "### Criando ratify"
git checkout -b ratify
#git checkout ratify
git push -u

git checkout develop

