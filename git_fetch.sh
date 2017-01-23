#!/bin/bash

if [ -z "$1" ]; then
	for branch in $(git branch -a | grep remotes | grep -v HEAD | grep -v master); do
		#echo ${branch#remotes/origin/} $branch
		#echo ${branch#remotes/} ${branch#remotes/origin/}
		git branch --track ${branch#remotes/origin/} $branch
	done
else
	git fetch --all
	git checkout "$1"
	git branch --set-upstream-to=origin/"$1" "$1"
	git branch --no-track "$1" remotes/origin/"$1"
	git pull
fi
git checkout develop