#!/bin/bash

cd $(pwd)

#rm -rf composer.lock bower_components node_modules vendor
#. resources/scripts/build.sh

FRAMEWORK=$([[ $(cat .git/config 2>&- | grep -i :thupan) ]] && echo thupan || echo vo)
PROJECT=$(cat .git/config 2>&- | grep -i :thupan | cut -d/ -f2 | cut -d. -f1)

if [[ ${PROJECT} ]]; then
    #statements
    GIT_BRANCH=$(git branch -a 2>&- | grep "*" | sed -e "s/* //")
    SERVER=$(cat .git/config 2>&- | grep -i ${GIT_BRANCH} | grep -i fetch | column -tx | cut -d/ -f5)

    case "${GIT_BRANCH}" in
        master)
            SERVER="apuau"
        ;;
        ratify)
            SERVER="cruxati"
        ;;
        training)
            SERVER="caiua"
        ;;
        *)
            SERVER="paranoa"
        ;;
    esac

    find public/* -type d -exec chmod 775 '{}' \;
    find public/* -type f -exec chmod 664 '{}' \;

    if [[ ${GIT_BRANCH} ]]; then
        #statements
        echo ${SERVER} ${PROJECT} ${GIT_BRANCH}
sftp -prC deploy@${SERVER}<<EOF
cd /var/www/thupan/${PROJECT}/
mkdir vendor
put -r vendor/
pwd
lpwd
cd public/
lcd public/
mkdir assets
put -r assets/
mkdir images
cd images/
lcd images/
mkdir pmm
put -r pmm/
bye
EOF
    fi
fi

