#!/bin/bash

#
# ssh-keygen -t rsa -b 4096 -C $(users)@$(hostname).manaus.am.gov.br
# echo $(users)_$(hostname)
# ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }' > /tmp/log_$(date +%Y%m%d.%H%M%S.%N)

# ssh git@git;
# if [ $(echo $?) == 0 ];
# then echo ok;
	cd ~/projects
	# for i in $(ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }');
	for i in $(ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($3 == "vo" || $3 == "thupan" || $3 == "slim") print $3"/"$4; }');
	do echo $i; git clone -b master git@git:$i.git $i >/dev/null 2>&1; done

	cd ~/projects
	for i in $(ls -r */*/.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	do echo $(pwd)/$i
		cd $(pwd)/$i
		git checkout . >/dev/null 2>&1
		git pull -f >/dev/null 2>&1
		git gc --force >/dev/null 2>&1
		git log -10 HEAD > log
		cd -
	done

	mkdir -p ~/projects/pmm/thupan
	cd ~/projects/pmm
	for i in $(ls -r ~/projects/vo); do pwd; echo $i; ln -sfvT ~/projects/vo/$i $i; done

	cd ~/projects/pmm/thupan
	for i in $(ls -r ~/projects/thupan); do pwd; echo $i; ln -sfvT ~/projects/thupan/$i/public $i; done

	cd ~/projects
	chmod g+w -R * >/dev/null 2>&1

	cd ~

	# cd /var/www
	# for i in $(ssh git@git | column -tx | tr / \\t | awk '{ if ($2 != "this") if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }');
	# 	do echo $i
	# 		git clone -b master git@git:"$i".git "$i"
	# done

	# cd /var/www
	# for i in $(ls -r */*/.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	# do echo $(pwd)/$i
	# 	cd $(pwd)/$i
	# 	git checkout . >/dev/null 2>&1
	# 	git pull -f >/dev/null 2>&1
	# 	git gc --force >/dev/null 2>&1
	# 	git log -10 HEAD > log
	# 	cd -
	# done

	# mkdir -p /var/www/pmm/thupan
	# cd /var/www/pmm
	# for i in $(ls -r /var/www/vo); do pwd; echo $i; ln -sfvT /var/www/vo/$i $i; done

	# cd /var/www/pmm/thupan
	# for i in $(ls -r /var/www/thupan); do pwd; echo $i; ln -sfvT /var/www/thupan/$i/public $i; done

	# cd /var/www
	# chmod g+w -R * >/dev/null 2>&1

	# cd ~
# fi