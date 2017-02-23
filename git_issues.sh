#!/bin/bash
umask 077

#echo $0 $1 $# $* $@
URL=redmine-dsti.manaus.am.gov.br

INCLUDE_USERS=memberships,groups
INCLUDE_ISSUES=journals,children,relations,attachments,changesets,watchers
INCLUDE_PROJECTS=trackers,issue_categories,enabled_modules

if [ ! -d /tmp/${USER} ];
	then mkdir -p /tmp/${USER}
fi

if [ -d .git ];
	then GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
fi

if [ -z "$1" ]
	then ISSUE=''
		#echo ${API_KEY_REDMINE} ${ISSUE}
		#curl "https://redmine-dsti.manaus.am.gov.br/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE)"&key="$(echo $TOKEN) | python -mjson.tool
		ISSUES=$(curl "https://"$(echo $URL)"/issues"$(echo $ISSUE)".json?include="$(echo $INCLUDE_ISSUES)"&key="$(echo $API_KEY_REDMINE))
		echo $ISSUES | python -mjson.tool > /tmp/${USER}/issues.json
		#cat /tmp/${USER}/issues.json | python -mjson.tool
		for i in $(cat /tmp/${USER}/issues.json | jq '.issues[].id'); do
			echo "Issue: #"$i
			curl "https://"$(echo $URL)"/issues/"$i".json?include="$(echo $INCLUDE_ISSUES)"&key="$(echo $API_KEY_REDMINE) | python -mjson.tool > /tmp/${USER}/$(echo $ISSUE).json
		done
		for j in $(cat /tmp/${USER}/issues.json | jq '.issues[].project.id'); do
			echo "Projetc: "$j
			curl "https://"$(echo $URL)"/projects/"$j".json?include="$(echo $INCLUDE_PROJECTS)"&key="$(echo $API_KEY_REDMINE) | python -mjson.tool > /tmp/${USER}/p$j.json
		done
	else
		ISSUE=$(echo "$1")
		#echo ${API_KEY_REDMINE} ${ISSUE}
		ISSUES=$(curl "https://"$(echo $URL)"/issues/"$(echo $ISSUE)".json?include="$(echo $INCLUDE_ISSUES)"&key="$(echo $API_KEY_REDMINE))
		echo $ISSUES | python -mjson.tool > /tmp/${USER}/$(echo $ISSUE).json

		ASSIGNED_TO_ID=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.assigned_to.id')
		curl "https://"$(echo $URL)"/users/"$(echo ${ASSIGNED_TO_ID})".json?include="$(echo $INCLUDE_USERS)"&key="$(echo $API_KEY_REDMINE) > /tmp/${USER}/$(echo ${ASSIGNED_TO_ID}).json

		ISSUE_ID=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.id')
		ASSIGNED_TO=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.assigned_to.name' | sed 's/\"//g')
		PARENT=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.parent.id')
		TRACKER=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.tracker.id')
		AUTHOR=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.author.name' | sed 's/\"//g')
		BRANCH=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
		TESTAR=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==28) | .value' | sed 's/\"//g')
		AMBIENTE_ID=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==21)' | jq '.id')
		AMBIENTE=$(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n' | sed 's/\ /\, /g')
		CREATED_ON=$(date -d $(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.created_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
		UPDATED_ON=$(date -d $(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.updated_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
		CLOSED_ON=$(date -d $(cat /tmp/${USER}/$(echo $ISSUE).json | jq '.issue.closed_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
		echo -e "\r"
		[[ ${PARENT} ]] && [[ ${BRANCH} ]] && echo -e "Deploy #${ISSUE_ID} @30m Merged branch ${BRANCH} into ${GIT_BRANCH}\n"
		[[ ${TRACKER} = 38 ]] && echo "Tarefa pai #"${PARENT}
		echo "Adicionado por "${AUTHOR}
		[[ ${BRANCH} ]] && echo "Branch: "${BRANCH}
		echo "Executar Teste? "$(if [[ ${TESTAR} == 1 ]]; then echo Sim; else echo Não; fi)
		[[ ${AMBIENTE} ]] && echo "Ambiente: "${AMBIENTE}
		echo -e "\r"

		ASSIGNED_TO_MAIL=$(cat /tmp/${USER}/$(echo ${ASSIGNED_TO_ID}).json | jq '.user.mail' | sed 's/\"//g')

		# echo "Signed-off-by: ${ASSIGNED_TO_ID}: ${ASSIGNED_TO} <${ASSIGNED_TO_MAIL}>"
		[[ ${ASSIGNED_TO_MAIL} ]] && echo "Signed-off-by: ${ASSIGNED_TO} <${ASSIGNED_TO_MAIL}>" || echo "Signed-off-by: ${ASSIGNED_TO}"
		echo -e "\r"

		[[ ${CREATED_ON} ]] && echo "Criado: ${CREATED_ON}"
		[[ ${UPDATED_ON} ]] && echo "Atualizado: ${UPDATED_ON}"
		[[ ${CLOSED_ON} ]] && echo "Fechado: ${CLOSED_ON}"
		echo -e "\r\n"
		exit 0
fi