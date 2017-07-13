#!/bin/bash
#
# {"array":[1,2,3],"boolean":true,"null":null,"number":123,"object":{"a":"b","c":"d","e":"f"},"string":"Hello World"}
#
umask 077

DATA_HORA=$(/bin/date +%Y%m%d.%H%M%S.%N)
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
	curl "https://${URL}.manaus.am.gov.br/users/current.json?include=${INCLUDE_USERS_}" -u ${LOGIN}:${PASSWORD} | jq '.' > /tmp/${USER}/${LOGIN}.json

	if [[ ! -s /tmp/${USER}/${LOGIN}.json ]]; then
		echo Opções Inválidas!;
		exit 1;
	fi

	API_KEY_REDMINE=$(cat /tmp/${USER}/${LOGIN}.json | jq '.user.api_key' | sed 's/\"//g')
	if [[ ${API_KEY_REDMINE} != 0 ]]; then
		echo api key! ${API_KEY_REDMINE};
	fi

	cat -bs /tmp/${USER}/${LOGIN}.json
}

get_issue ()
{
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json?include=${INCLUDE_ISSUES_}" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" | jq '.' > /tmp/${USER}/${ISSUE}.json
	cat -bs /tmp/${USER}/${ISSUE}.json
	# curl "https://${URL}.manaus.am.gov.br/watchers/watch?object_id=${ISSUE}&object_type=issue" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X POST  | jq '.' > /tmp/${USER}/${ISSUE}_watch.json
	# cat -bs /tmp/${USER}/${ISSUE}_watch.json
}

put_issue ()
{
	ISSUE_PUT='{
		"issue": {
			"description": "Teste",
			"status_id": 10,
			"assigned_to_id": 3,
			"watcher_user_ids": [
				3
			],
			"notes": "Iniciando Merge...",
			"done_ratio": 40,
			"start_date": "'${DATA}'",
			"custom_fields": [
				{
					"id": 23,
					"value": "'${DATA}'"
				}
			]
		}
	}'
	echo ${ISSUE_PUT} > /tmp/${USER}/${ISSUE}_put.json
	cat -bs /tmp/${USER}/${ISSUE}_put.json
	curl "https://${URL}.manaus.am.gov.br/issues/${ISSUE}.json" -H "X-Redmine-API-Key: ${API_KEY_REDMINE}" -H "Content-Type: application/json" -X PUT --data-binary @/tmp/${USER}/${ISSUE}_put.json | jq '.' > /tmp/${USER}/${ISSUE}_put.json
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