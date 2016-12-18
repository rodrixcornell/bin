#!/bin/bash
umask 077

INCLUDE=journals,children,relations,attachments,changesets,watchers

if [ ! -d /tmp/${USER} ];
	then mkdir -p /tmp/${USER}
fi

if [ -z "$1" ]
	then ISSUE=''
		echo ${API_KEY_REDMINE} ${ISSUE}
		#curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $TOKEN) | python -mjson.tool
		curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $API_KEY_REDMINE) > /tmp/${USER}/issues.json
		#cat /tmp/${USER}/issues.json | python -mjson.tool
	else
		ISSUE=$(echo "/$1")
		echo ${API_KEY_REDMINE} ${ISSUE}
		curl "http://redmine.dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $API_KEY_REDMINE) > /tmp/${USER}/$(echo $ISSUE).json
		PARENT=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.parent.id')
		TRACKER=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.tracker.id')
		AUTHOR=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.author.name' | sed 's/\"//g')
		BRANCH=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
		TESTAR=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==28) | .value' | sed 's/\"//g')
		AMBIENTE=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n' | sed 's/\ /\, /g')
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