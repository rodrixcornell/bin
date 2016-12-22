#!/bin/bash

cd $(pwd)

FRAMEWORK=$([[ $(cat .git/config 2>&- | grep -i :thupan) ]] && echo thupan || echo vo)
PROJECT=$(cat .git/config 2>&- | grep -i :thupan | cut -d/ -f2 | cut -d. -f1)

if [[ ${PROJECT} ]]; then
	#statements
	GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
	SERVER=$(cat .git/config 2>&- | grep -i ${GIT_BRANCH} | grep -i fetch | column -tx | cut -d/ -f5)

	if [[ ${GIT_BRANCH} ]]; then
		#statements
		echo ${SERVER} ${PROJECT} ${GIT_BRANCH}
sftp -prC deploy@${SERVER}<<EOF
cd www/thupan/${PROJECT}/
mkdir vendor
put -r vendor/
mkdir public/assets/dist
put -r public/assets/dist/ public/assets/
mkdir public/assets/fonts
put -r public/assets/fonts/ public/assets/
bye
EOF
	fi
fi

