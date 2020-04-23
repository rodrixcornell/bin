#!/bin/bash

#sudo -E mount /dev/sdb2 /media/rodrigocabral/xt-linux -t ext3 -o nosuid,nodev,nofail,x-gvfs-show

# ssh-keygen -t rsa -b 4096 -C $(users)@$(hostname).manaus.am.gov.br
# echo $(users)_$(hostname)
# ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }' > /tmp/log_$(date +%Y%m%d.%H%M%S.%N)

ssh git@git info;
if [ $(echo $?) == 0 ];
then echo ok;
	# mkdir -p ~/projects
	# cd ~/projects
	# for i in $(ssh git@git 2>&- | column -tx | tr / \\t | awk '{ if ($3 != "this") if ($4 == "") print $3; else print $3"/"$4; }');
	# #for i in $(ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }');
	# 	do echo $i
	# 		#git clone -b master git@git:$i.git $i
	# 		git clone git@git:$i.git $i
	# 		#[[ $? == 0 ]] && echo -e "Criado!" || echo -e "Já Existe! ou Error!"
	# done

	# cd ~/projects
	# for i in $(ls -r */.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	# do echo $(pwd)/$i
	# 	cd $(pwd)/$i
	# 	git checkout master 2>&-
	# 	git checkout .
	# 	git tag $(git branch -a 2>&- | grep "*" | sed -e "s/* //")-$(date +%Y%m%d.%H%M%S.%N) ; git push origin --tags
	# 	git pull -f
	# 	git gc --force
	# 	cd -
	# done

	# cd ~/projects
	# for i in $(ls -r */*/.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	# do echo $(pwd)/$i
	# 	cd $(pwd)/$i
	# 	git checkout master 2>&-
	# 	git checkout .
	# 	git tag $(git branch -a 2>&- | grep "*" | sed -e "s/* //")-$(date +%Y%m%d.%H%M%S.%N) ; git push origin --tags
	# 	git pull -f
	# 	git gc --force
	# 	cd -
	# done

	# cd ~/projects
	# #for i in $(ls -r */.git | grep -v pmm | grep -i : | sed "s/\/.git://"); do pwd; echo $i; zip -r $i\_$(date +%Y%m%d.%H%M%S.%N) $i; done
	# for i in $(ls -l | grep -i drwx | awk '{ print $9 }'); do echo $(pwd)/$i; zip -r $(date +%Y%m%d.%H%M%S.%N)_$i.zip $i; done

	#mkdir -p ~/projects/pmm/thupan
	#cd ~/projects/pmm
	#for i in $(ls -r ~/projects/vo); do pwd; echo $i; ln -sfvT ~/projects/vo/$i $i; done

	#cd ~/projects/pmm/thupan
	#for i in $(ls -r ~/projects/thupan); do pwd; echo $i; ln -sfvT ~/projects/thupan/$i/public $i; done

	#cd ~/projects
	#chmod g+w -R *

	cd ~

	mkdir -p ~/repos
	cd ~/repos/
	rm -rf W 2>&1
	#[ -d ~/repos/ ] && rm -rfv ~/repos/* || echo no
	for i in $(ssh git@git | column -tx | tr / \\t | awk '{ if ($3 != "this") if ($4 == "") print $3; else print $3"/"$4; }');
		do echo $i
			#git clone --mirror git@git:$i.git $i.git
			git clone --mirror git@git:$i.git $i.git
	done

	cd ~/repos/
	rm -rf W 2>&1
	for i in $(ls -r *.git | grep -i : | sed "s/://");
		do echo $(pwd)/$i
			cd $(pwd)/$i
			git fetch --all 2>&1
			git gc --aggressive 2>&1
			git push -u gitlab --all 2>&1
			git push -u gitlab --tags 2>&1
			cd -
	done

	cd ~/repos/
	rm -rf W 2>&1
	for i in $(ls -r */*.git | grep -i : | sed "s/://");
		do echo $(pwd)/$i
			cd $(pwd)/$i
			git fetch --all 2>&1
			git gc --aggressive 2>&1
			git push -u gitlab --all 2>&1
			git push -u gitlab --tags 2>&1
			cd -
	done

	cd ~/repos/
	rm -rf W 2>&1
	rm -rf ~/repos/*zip 2>&1
	for i in $(ls -l | grep -i drwx | awk '{ print $9 }'); do
		echo $(pwd)/$i;
		echo "zip -9r $(date +%Y%m%d-%H%M%S-%N)_${HOSTNAME}_$i.zip  $i";
		zip -9r $(date +%Y%m%d-%H%M%S-%N)_${HOSTNAME}_$i.zip  $i;
		# if [[ $i == 'vo' || $i == 'thupan' ]]; then
		# 	zip -9r ~/repos/$(date +%Y%m%d-%H%M%S-%N)_${HOSTNAME}_$i.zip $i;
		# fi
	done

	rm -rf W 2>&1
	cd ~
	#rm -rf ~/repos 2>&1
fi

