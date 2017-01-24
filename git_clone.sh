#!/bin/bash -f

#cd /c/xampp/htdocs
#for i in $(ssh git@git | tr / \\t | awk '{ if ($3 != "this" && ($3 == "vo" || $3 == "thupan")) if ($3 == "vo") print $3"/"$4" "$4; else print $3"/"$4" "$3"/"$4; }'); do echo $i && git clone git@git:$i && cd $i && fetch.sh && cd -; done
#cd -

PWD=$(pwd)
#for i in $(ssh git@git | column -tx | tr / \\t | awk '{ if ($3 != "this") if ($4 == "") print $3; else print $3"/"$4; }');
#	do
#	cd "$PWD"
#	echo "$i"
#	git clone git@git:"$i".git "$i".git
#	cd "$i"
#	git_fetch.sh
#	cd -
#done

for i in $(ssh git@git | grep vo/ | cut -f2-3);
	do
	cd $PWD
	# verção windows
	#echo "$i" $(echo "$i" | sed "s/vo\///g")
	#git clone -b develop git@git:"$i" $(echo "$i" | sed "s/vo\///g")
	#cd $(echo "$i" | sed "s/vo\///g")
	# verção linux
	echo "$i"
	git clone -b develop git@git:"$i".git "$i"_git
	cd "$i"_git
	git_fetch.sh
	cd -
done

for i in $(ssh git@git | grep thupan/ | cut -f2-3);
	do
	cd "$PWD"
	echo "$i"
	git clone -b develop git@git:"$i".git "$i"_git
	cd "$i"_git
	git_fetch.sh
	cd -
done
