#!/bin/bash

git tag $(git branch -a 2>&- | grep "*" | sed -e "s/* //")-$(date +%Y%m%d.%H%M%S.%N) ; git push origin --tags
