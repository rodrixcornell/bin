#!/bin/bash

TOKEN=
INCLUDE=journals,children,relations,attachments,changesets,watchers
if [ -z "$1" ]
	then ISSUE=''
		#echo ${TOKEN} ${ISSUE}
		#curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $TOKEN) | python -mjson.tool
		curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $TOKEN) > /tmp/issues.json
		#cat /tmp/issues.json | python -mjson.tool
	else
		ISSUE=$(echo "/$1")
		curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $TOKEN) > /tmp/$(echo $ISSUE).json
		PARENT=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.parent.id')
		TRACKER=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.tracker.id')
		AUTHOR=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.author.name' | sed 's/\"//g')
		BRANCH=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
		TESTAR=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==28) | .value' | sed 's/\"//g')
		AMBIENTE=$(cat /tmp/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n' | sed 's/\ /\, /g')
		echo -e "\r"
		[[ ${PARENT} != null ]] && [[ -n ${BRANCH} ]] && echo -e "Merged branch ${BRANCH} into develop\n"
		[[ ${TRACKER} = 38 ]] && echo "Tarefa pai #"${PARENT}
		echo "Adicionado por "${AUTHOR}
		[[ -n ${BRANCH} ]] && echo "Branch: "${BRANCH}
		echo "Executar Teste? "$(if [ -n ${TESTAR} ]; then echo Sim; else echo Não; fi)
		[[ -n ${AMBIENTE} ]] && echo "Ambiente: "${AMBIENTE}
		echo -e "\r"
		echo "Signed-off-by: Rodrigo Cabral <rodrixcornell@gmail.com>"
		echo -e "\r\n"
		exit 0
fi