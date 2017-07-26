#!/bin/bash
#
# {"array":[1,2,3],"boolean":true,"null":null,"number":123,"object":{"a":"b","c":"d","e":"f"},"string":"Hello World"}
#
umask 077

# DATA_HORA=$(/bin/date +%Y%m%d.%H%M%S.%N)
DATA_HORA=$(date +%Y-%m-%d\ %H:%M:%S)
DATA=$(date +%Y-%m-%d)
MENSAGEM_USO="
Escreva o #ID da tarefa do Redmine.

Uso:
	$(basename "$0") [OPÇÕES]
	$(basename "$0") -l [login] -p [123456]

OPÇÕES:
	-l, --login       [LOGIN]       Redmine login
	-p, --password    [PASSWORD]    Redmine password

	-h, --help        Mostra esta tela de ajuda e sai
"
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
}

get_user ()
{
	if [ ! -s /tmp/${USER}/${LOGIN}.json ]; then
		echo maior 0 $?
		curl "https://${URL}.manaus.am.gov.br/users/current.json?include=${INCLUDE_USERS_}" -u ${LOGIN}:${PASSWORD} > /tmp/${USER}/${LOGIN}.json
	else
		echo menor 0 $?
		# curl "https://${URL}.manaus.am.gov.br/users/current.json?include=${INCLUDE_USERS_}" -u ${LOGIN}:${PASSWORD} > /tmp/${USER}/${LOGIN}.json
	fi

	# if [ ! -s /tmp/${USER}/${LOGIN}.json ]; then
	# 	echo maior 0 $?
	# 	echo Opções Inválidas!;
	# 	echo X-Redmine-API-Key não encontrada!;
	# 	exit 1;
	# fi

	API_KEY_REDMINE=$(cat /tmp/${USER}/${LOGIN}.json | jq '.user.api_key' | sed 's/\"//g')
	if [[ ${API_KEY_REDMINE} != 0 ]]; then
		echo api key! ${API_KEY_REDMINE};
	fi

	# cat -bs /tmp/${USER}/${LOGIN}.json
}

get_issue ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json?include=${INCLUDE_ISSUES_}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" > /tmp/${USER}/${ISSUE}.json
	# cat -bs /tmp/${USER}/${ISSUE}.json

	BRANCH=$(cat /tmp/${USER}/${ISSUE}.json | jq '.issue.custom_fields[] | select(.id==27) | .value' | sed 's/\"//g')
	echo ${BRANCH}
}

put_issue ()
{
	# ISSUE_PUT='{"issue":{"description":"...","status_id":2,"assigned_to_id":3,"notes":"Iniciando Merge...\r\n'${DATA_HORA}'","done_ratio":30,"start_date":"'${DATA}'","due_date":"","custom_fields":[{"id":23,"value":"'${DATA}'"},{"id":26,"value":"'${DATA}'"}]}}'
	# echo ${ISSUE_PUT} > /tmp/${USER}/${ISSUE}_put.json
	echo '{"issue":{"description":"...","status_id":2,"assigned_to_id":3,"notes":"Iniciando Merge...\r\n'${DATA_HORA}'","done_ratio":30,"start_date":"'${DATA}'","due_date":"","custom_fields":[{"id":23,"value":"'${DATA}'"},{"id":26,"value":"'${DATA}'"}]}}' > /tmp/${USER}/${ISSUE}_put.json
	# cat -bs /tmp/${USER}/${ISSUE}_put.json
	# echo "curl https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X PUT --data-binary \'${ISSUE_PUT}\'
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X PUT --data-binary @/tmp/${USER}/${ISSUE}_put.json > /tmp/${USER}/${ISSUE}_put2.json
	# cat -bs /tmp/${USER}/${ISSUE}_put2.json
}

pull_branch ()
{
	echo -e "\r"
	if [ -d .git ]; then
		GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
		# echo ${GIT_BRANCH} branch atual
		# echo -e "$?\r"
		# echo $(git branch -a 2>&- | grep -i /${BRANCH})
		GIT_REFS=$(git branch --track $(echo ${BRANCH} $(git branch -a 2>&- | grep -i /${BRANCH})))
		# echo ${GIT_REFS}
		GIT_REFS_RETURN=$(echo $?)

		if [ ${GIT_REFS_RETURN} = 0 ];
			then echo ${GIT_REFS}
			else echo ${GIT_REFS}
		fi
	fi
}


#
#
#

check_curl
check_git

if [ ! -d /tmp/${USER} ]; then mkdir -p /tmp/${USER}; fi

if [ -z "$1" ];
then
	echo "$MENSAGEM_USO";
	exit 0;
fi

while test -n "$1"
do
	case "$1" in
		-l | --login)
			shift
			LOGIN=$(echo "$1" | tr A-Z a-z)
		;;
		-p | --password)
			shift
			PASSWORD=$(echo "$1")
		;;
		-i | --issue)
			shift
			ISSUE=$(echo "$1" | tr A-Z a-z)
		;;

		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;
		-V | --version)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalhos do programa
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;
		*)
			echo Opção inválida: "$1"
			exit 1
		;;
	esac

	# Opção $1 já processada, a fila deve andar
	shift
done

get_user
get_issue

echo ${URL} - ${ISSUE} - ${LOGIN}:${PASSWORD}

put_issue
pull_branch







# .git/COMMIT_EDITMSG