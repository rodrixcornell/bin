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

TEMP="/tmp/.${USER}"

####
# Redmine Config
#

# LOGIN=rodrigo.cabral
# PASSWORD=

# URL=parnamirim
# URL=pericuma
URL=carius
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
		sudo -E apt-get install -q -y curl
	fi
}

check_git ()
{
	echo "Checking for git..."
	if command -v git > /dev/null; then
		echo "Detected git..."
	else
		echo "Installing git..."
		sudo -E apt-get install -q -y git
	fi

	git config --global merge.ff false
}

check_meld ()
{
	echo "Checking for meld..."
	if command -v meld > /dev/null; then
		echo "Detected meld..."
	else
		echo "Installing meld..."
		sudo -E apt-get install -q -y meld
	fi
}

get_user ()
{

	reset

	if [ ! -d ${TEMP} ]; then mkdir -p ${TEMP}; fi

	USER_REDMINE=${TEMP}/user_redmine
	PASSWORD_REMINE=${TEMP}/password_redmine

	if [ ! $(cat ${USER_REDMINE}) ]; then dialog --inputbox "Digite o nome do usuário Redmine" 7 40 2> ${USER_REDMINE}; fi

	clear
	[ ! $(cat ${USER_REDMINE}) ] && echo ok
	LOGIN=$(cat ${USER_REDMINE})
	# sleep 5


	# if [ $(cat ${PASSWORD_REMINE}) >= 0 ]; then dialog --passwordbox "Digite a senha Redmine" 0 0 2> ${PASSWORD_REMINE}; fi
	if [ ! $(cat ${PASSWORD_REMINE}) ]; then dialog --inputbox "Digite a senha Redmine" 0 0 2> ${PASSWORD_REMINE}; fi

	clear
	[ ! $(cat ${PASSWORD_REMINE}) ] && echo ok
	PASSWORD=$(cat ${PASSWORD_REMINE})
	# sleep 5


	curl "https://${URL}.manaus.am.gov.br/users/current.json?include=${INCLUDE_USERS}" -u ${LOGIN}:${PASSWORD} > ${TEMP}/${LOGIN}.json
	# cat -bs ${TEMP}/${LOGIN}.json
	if [ ! "$(cat ${TEMP}/${LOGIN}.json)" ]; then
		echo "Usuário ou Senha Errado!\n"
		rm ${TEMP}/*
		exit
	fi

	USER_ID=$(cat ${TEMP}/${LOGIN}.json | jq '.user.id')
	MAIL=$(cat ${TEMP}/${LOGIN}.json | jq '.user.mail' | sed 's/\"//g')
	API_KEY_REDMINE=$(cat ${TEMP}/${LOGIN}.json | jq '.user.api_key' | sed 's/\"//g')
	# echo api key! ${API_KEY_REDMINE};

}

get_issue ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json?include=${INCLUDE_ISSUES}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" > ${TEMP}/${ISSUE}.json
	# cat -bs ${TEMP}/${ISSUE}.json

	ISSUE_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.id')
	PROJETC_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.project.id')
	TRACKER_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.tracker.id')
	STATUS_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.status.id')
	PRIORITY_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.priority.id')
	AUTHOR=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.author.name' | sed 's/\"//g')
	ASSIGNED_TO_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.assigned_to.id')
	ASSIGNED_TO=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.assigned_to.name' | sed 's/\"//g')
	PARENT_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.parent.id')

	BRANCH=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
	BRANCH_NO_WHITESPACE="$(echo -e "${BRANCH}" | tr -d '[:space:]')"
	# echo -e "BRANCH_NO_WHITESPACE='${BRANCH_NO_WHITESPACE}'"
	# echo -e "length(BRANCH_NO_WHITESPACE)==${#BRANCH_NO_WHITESPACE}"
	BRANCH=${BRANCH_NO_WHITESPACE}

	TESTAR=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==28) | .value' | sed 's/\"//g')
	AMBIENTE_ID=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21)' | jq '.id')
	# AMBIENTE=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | sed 's/\"//g' | xargs -d'\n' | sed 's/\ /\, /g')
	AMBIENTE=$(cat ${TEMP}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==21) | .value[]' | xargs -d'\n')
	CREATED_ON=$(date -d $(cat ${TEMP}/${ISSUE}.json | jq '.issue.created_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
	UPDATED_ON=$(date -d $(cat ${TEMP}/${ISSUE}.json | jq '.issue.updated_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
	CLOSED_ON=$(date -d $(cat ${TEMP}/${ISSUE}.json | jq '.issue.closed_on' | sed 's/\"//g') "+%Y-%m-%d %H:%M:%S" 2>&- )
}

get_parent_task ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${PARENT_ID}.json?include=${INCLUDE_ISSUES}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" > ${TEMP}/${PARENT_ID}.json
	# cat -bs ${TEMP}/${PARENT_ID}.json
}

pull_branch ()
{
	# echo -e "\r"
	# set -xv
	if [ -d .git ]; then
		BRANCHS=("develop" "test" "ratify" "master")
		for i in "${BRANCHS[@]}"; do echo $i; git checkout -f $i; git pull -f; git gc; done

		AMBIENTES=($( echo ${AMBIENTE}  | sed 's/\"//g'))
		# echo ${#AMBIENTES[@]}
		for (( idx=${#AMBIENTES[@]}-1 ; idx>=0 ; idx-- ))
			do #echo "${AMBIENTES[idx]}";
			if [ ${AMBIENTES[idx]} == 'Produção' ]; then git checkout master; break; fi
			if [ ${AMBIENTES[idx]} == 'Homologação' ]; then git checkout ratify; break; fi
			if [ ${AMBIENTES[idx]} == 'Teste' ]; then git checkout test; break; fi
		done

		GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
		echo ${GIT_BRANCH} branch atual
		git pull -f
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
		if [ ${GIT_BRANCH} == 'master' ]; then git tag ${GIT_BRANCH}-${DH_LOG}; git push origin --tags; fi
	fi
	# set +xv
	# echo -e "\r"
}

gitgui_msg ()
{
	echo -e "\rMerge branch ${BRANCH} into ${GIT_BRANCH}\r\nDeploy #${ISSUE_ID} @20m\n\r\nTarefa pai Refs #${PARENT_ID}\r\nAdicionado por ${AUTHOR}\r\nBranch: ${BRANCH}\r\nExecutar Teste? $(if [[ ${TESTAR} == 1 ]]; then echo Sim; else echo Não; fi)\r\nAmbiente: $(echo ${AMBIENTE} | sed 's/\ /\, /g')\n\r\nCriado: ${CREATED_ON}\r\nAtualizado: ${UPDATED_ON}\r\nFechado: ${CLOSED_ON}\n\r\nSigned-off-by: ${ASSIGNED_TO} <${MAIL}>" > .git/GITGUI_MSG
	# MERGE_MSG=$(echo -e "\rMerge branch ${BRANCH} into ${GIT_BRANCH}\r\nDeploy #${ISSUE_ID} @20m\n\r\nTarefa pai Refs #${PARENT_ID}\r\nAdicionado por ${AUTHOR}\r\nBranch: ${BRANCH}\r\nExecutar Teste? $(if [[ ${TESTAR} == 1 ]]; then echo Sim; else echo Não; fi)\r\nAmbiente: $(echo ${AMBIENTE} | sed 's/\ /\, /g')\n\r\nCriado: ${CREATED_ON}\r\nAtualizado: ${UPDATED_ON}\r\nFechado: ${CLOSED_ON}\n\r\nSigned-off-by: ${ASSIGNED_TO} <${MAIL}>")
	# echo ${MERGE_MSG} > .git/GITGUI_MSG

	cat .git/GITGUI_MSG
}

put_issue ()
{
	curl "https://${URL}.manaus.am.gov.br/sys/fetch_changesets?key=8aMjkoLLk40jTBaSTOai"

	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=${USER_ID}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=3" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=15" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=18" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=25" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}/watchers.json?user_id=77" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST

	echo '{"issue":{"description":"...","status_id":10,"assigned_to_id":'${USER_ID}',"notes":"Iniciando Merge do Branch '${BRANCH}'\r\n'${DATA_HORA}'","done_ratio":10,"start_date":"'${DATA}'","due_date":"","custom_fields":[{"id":23,"value":"'${DATA}'"},{"id":26,"value":"'${DATA}'"}]}}' > ${TEMP}/${ISSUE}_put.json
	# cat -bs ${TEMP}/${ISSUE}_put.json

	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X PUT --data-binary @${TEMP}/${ISSUE}_put.json > ${TEMP}/${ISSUE}_put2.json
	# cat -bs ${TEMP}/${ISSUE}_put2.json
}

#
#
#

check_curl
check_git
check_meld

get_user

ISSUE=$(echo "$1" | tr A-Z a-z)

if [ ${ISSUE} ];then

	put_issue
	get_issue
	get_parent_task

	# echo ${URL} - ${ISSUE} - ${LOGIN}:${PASSWORD}

	pull_branch
	gitgui_msg


	GIT_MERGE=$(git merge -m "$(cat .git/GITGUI_MSG)" ${BRANCH} 2>&1)
	GIT_MERGE_RETURN=$(echo $?)

	if [ ${GIT_MERGE_RETURN} == 0 ];
		then echo ${GIT_MERGE_RETURN} Merge executado com Sucesso!
		# ; git commit --amend;
	else echo ${GIT_MERGE_RETURN} ${GIT_MERGE}
		git status
	fi

else
	echo Escreva o ID da tarefa do Redmine.
fi




# .git/COMMIT_EDITMSG
# .git/GITGUI_MSG
# .git/MERGE_MSG