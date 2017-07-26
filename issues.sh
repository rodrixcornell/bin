#!/bin/bash
# -vx
#
# {"array":[1,2,3],"boolean":true,"null":null,"number":123,"object":{"a":"b","c":"d","e":"f"},"string":"Hello World"}
#
umask 077

# DATA_HORA=$(/bin/date +%Y%m%d.%H%M%S.%N)
DH_LOG=$(date +%Y%m%d.%H%M%S.%N)
DATA_HORA=$(date +%Y-%m-%d\ %H:%M:%S)
DATA=$(date +%Y-%m-%d)


####
# Redmine Config
#

LOGIN=rodrigo.cabral
PASSWORD=QWEpoi123@@

# URL=parnamirim
URL=pericuma
# URL=carius
INCLUDE_USERS=memberships,groups
INCLUDE_ISSUES=journals,children,relations,attachments,changesets,watchers
INCLUDE_PROJECTS=trackers,issue_categories,enabled_modules

check_curl ()
{
	echo "Checking for curl..."
	if command -v curl > /dev/null; then
		echo "Detected curl..."
	else
		echo "Installing curl..."
		sudo apt-get install -q -y curl
	fi
}

check_git ()
{
	echo "Checking for git..."
	if command -v git > /dev/null; then
		echo "Detected git..."
	else
		echo "Installing git..."
		sudo apt-get install -q -y git
	fi

	git config --global merge.ff false
}

get_user ()
{
	USER_REDMINE="/tmp/.user_redmine"
	PASSWORD_REMINE="/tmp/.password_redmine"

	dialog --inputbox "Digite o nome do usuário Redmine" 7 40 2> $USER_REDMINE
	USERNAME=`cat $USER_REDMINE`

	dialog --passwordbox "Digite a senha Redmine" 0 0 2> $PASSWORD_REMINE
	PASSWORDS=$(cat $PASSWORD_REMINE)

	echo -e "\r\n"

	curl "https://${URL}.manaus.am.gov.br/users/current.json?include=${INCLUDE_USERS}" -u ${LOGIN}:${PASSWORD} > /tmp/${USER}/${LOGIN}.json

	USER_ID=$(cat /tmp/${USER}/${LOGIN}.json | jq '.user.id')
	MAIL=$(cat /tmp/${USER}/${LOGIN}.json | jq '.user.mail' | sed 's/\"//g')
	API_KEY_REDMINE=$(cat /tmp/${USER}/${LOGIN}.json | jq '.user.api_key' | sed 's/\"//g')
	# echo api key! ${API_KEY_REDMINE};

	# cat -bs /tmp/${USER}/${LOGIN}.json

	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=${USER_ID}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=15" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=18" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=25" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=77" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
}

get_issue ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json?include=${INCLUDE_ISSUES}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" > /tmp/${USER}/${ISSUE}.json
	# cat -bs /tmp/${USER}/${ISSUE}.json

	PARENT_ID=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.parent.id')
	BRANCH=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
	# echo ${BRANCH}
}

get_parent_task ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${PARENT_ID}.json?include=${INCLUDE_ISSUES}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" > /tmp/${USER}/${PARENT_ID}.json
	# cat -bs /tmp/${USER}/${PARENT_ID}.json
}

put_issue ()
{
	echo '{"issue":{"description":"...","status_id":10,"assigned_to_id":3,"notes":"Iniciando Merge...\r\n'${DATA_HORA}'","done_ratio":30,"start_date":"'${DATA}'","due_date":"","custom_fields":[{"id":23,"value":"'${DATA}'"},{"id":26,"value":"'${DATA}'"}]}}' > /tmp/${USER}/${ISSUE}_put.json
	# cat -bs /tmp/${USER}/${ISSUE}_put.json

	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X PUT --data-binary @/tmp/${USER}/${ISSUE}_put.json > /tmp/${USER}/${ISSUE}_put2.json
	# cat -bs /tmp/${USER}/${ISSUE}_put2.json
}

pull_branch ()
{
	# echo -e "\r"
	if [ -d .git ]; then
		GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
		echo ${GIT_BRANCH} branch atual
		# echo -e "$?\r"
		# echo $(git branch -a 2>&- | grep -i /${BRANCH})
		if [ ${BRANCH} ]; then
			GIT_REFS=$(git branch --track $(echo ${BRANCH} $(git branch -a | grep -i /${BRANCH})) 2>&1)
			# echo ${GIT_REFS}
			GIT_REFS_RETURN=$(echo $?)

			if [ ${GIT_REFS_RETURN} == 0 ];
				then echo ${GIT_REFS}
				# else echo ${GIT_REFS}
				else echo fatal: Já existe uma ramificação com o nome \'${BRANCH}\'.
			fi
		fi

		#
		git tag ${GIT_BRANCH}-${DH_LOG}
		git push origin --tags
	fi
	# echo -e "\r"
}

gitgui_msg ()
{
	ASSIGNED_TO_ID=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.assigned_to.id')
	ISSUE_ID=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.id')
	ASSIGNED_TO=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.assigned_to.name' | sed 's/\"//g')
	# PARENT_ID=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.parent.id')
	TRACKER=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.tracker.id')
	AUTHOR=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.author.name' | sed 's/\"//g')
	# BRANCH=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
	TESTAR=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==28) | .value' | sed 's/\"//g')
	AMBIENTE_ID=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21)' | jq '.id')
	# AMBIENTE=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n' | sed 's/\ /\, /g')
	AMBIENTE=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n')
	CREATED_ON=$(date -d $(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.created_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
	UPDATED_ON=$(date -d $(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.updated_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
	CLOSED_ON=$(date -d $(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.closed_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )

	MERGE_MSG="\rMerge branch '${BRANCH}' into ${GIT_BRANCH}\r\nDeploy #${ISSUE_ID} @20m\n\r\nTarefa pai Refs #${PARENT_ID}\r\nAdicionado por ${AUTHOR}\r\nBranch: ${BRANCH}\r\nExecutar Teste? $(if [[ ${TESTAR} == 1 ]]; then echo Sim; else echo Não; fi)\r\nAmbiente: $(echo ${AMBIENTE} | sed 's/\ /\, /g')\n\r\nCriado: ${CREATED_ON}\r\nAtualizado: ${UPDATED_ON}\r\nFechado: ${CLOSED_ON}\n\r\nSigned-off-by: ${ASSIGNED_TO} <${MAIL}>"
	echo -e ${MERGE_MSG} > .git/GITGUI_MSG

	# cat .git/GITGUI_MSG
}

#
#
#

check_curl
check_git

if [ ! -d /tmp/${USER} ]; then mkdir -p /tmp/${USER}; fi

ISSUE=$(echo "$1" | tr A-Z a-z)

get_user

if [ ${ISSUE} ];then
	get_issue
	get_parent_task

	# echo ${URL} - ${ISSUE} - ${LOGIN}:${PASSWORD}

	put_issue
	get_issue
	pull_branch

	gitgui_msg

	GIT_MERGE=$(git merge -m "$(echo -e ${MERGE_MSG})" ${BRANCH} 2>&1)
	GIT_MERGE_RETURN=$(echo $?)

	if [ ${GIT_MERGE_RETURN} == 0 ];
		then echo ${GIT_MERGE_RETURN} Merge executado com Sucesso!
	else echo ${GIT_MERGE_RETURN} ${GIT_MERGE}

	fi

else
	echo Escreva o ID da tarefa do Redmine.
fi




# .git/COMMIT_EDITMSG
# .git/GITGUI_MSG
# .git/MERGE_MSG