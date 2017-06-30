#!/bin/bash

#
# ssh-keygen -t rsa -b 4096 -C $(users)@$(hostname).manaus.am.gov.br
# echo $(users)_$(hostname)
# ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }' > /tmp/log_$(date +%Y%m%d.%H%M%S.%N)

cd ~/repos/
#[ -d ~/repos/ ] && rm -rfv ~/repos/* || echo no
for i in $(ssh git@git | column -tx | tr / \\t | awk '{ if ($3 != "this") if ($3 == "") print $2; else print $2"/"$3; }');
	do echo $i
		git clone --mirror git@git:$i.git $i.git >/dev/null 2>&1
done

cd ~/repos/
for i in $(ls -r *.git | grep -i : | sed "s/://");
	do echo $(pwd)/$i
		cd $(pwd)/$i
		git fetch --all 2>&1
		git gc 2>&1
		cd -
done

cd ~/repos/
for i in $(ls -r */*.git | grep -i : | sed "s/://");
	do echo $(pwd)/$i
		cd $(pwd)/$i
		git fetch --all 2>&1
		git gc 2>&1
		cd -
done

cd ~

curl https://$(hostname).manaus.am.gov.br/sys/fetch_changesets?key=8aMjkoLLk40jTBaSTOai
