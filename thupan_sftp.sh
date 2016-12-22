#!/bin/bash

cd $(pwd)

FRAMEWORK=$([[ $(cat .git/config 2>&- | grep -i :thupan) ]] && echo thupan || echo vo)
PROJECT=$(cat .git/config 2>&- | grep -i :thupan | cut -d/ -f2 | cut -d. -f1)
GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")

if [[ ${PROJECT} ]]; then
	#statements
	if [[ ${GIT_BRANCH} ]]; then
		#statements
		echo ${GIT_BRANCH}
		echo ${PROJECT}
		echo $(cat .git/config | grep -i ${GIT_BRANCH} | grep -i fetch | column -tx | cut -d/ -f5)
	fi
fi

