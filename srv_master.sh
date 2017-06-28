#!/bin/bash

#ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }' > /tmp/log_$(date +%Y%m%d.%H%M%S.%N)

cd ~/public_html
for i in $(ssh git@git 2>&- | column -tx | sed 's/\//\t/g' | awk '{ if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }');
	do echo $i
		git clone -b master git@git:$i.git $i >/dev/null 2>&1
		#[[ $? == 0 ]] && echo -e "Criado!" || echo -e "Já Existe! ou Error!"
done

cd ~/public_html
for i in $(ls -r */*/.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	do echo $(pwd)/$i
		cd $(pwd)/$i
		git checkout .
		git pull -f 2>&1
		git gc --force 2>&1
		cd -
done

cd ~/public_html
for i in $(ls -r vo); do echo $i; ln -sf $PWD/vo/$i $PWD/pmm/$i; done

cd ~/public_html
mkdir -p pmm/thupan
for i in $(ls -r thupan); do echo $i; ln -sf $PWD/thupan/$i/public $PWD/pmm/thupan/$i; done

chmod g+w -R * >/dev/null 2>&1

cd ~

cd /var/www
for i in $(ssh git@git | column -tx | tr / \\t | awk '{ if ($2 != "this") if ($2 == "vo" || $2 == "thupan") print $2"/"$3; }');
	do echo $i
		git clone -b master git@git:"$i".git "$i"
done

cd /var/www
for i in $(ls -r */*/.git | grep -v pmm | grep -i : | sed "s/\/.git://");
	do echo $(pwd)/$i
		cd $(pwd)/$i
		git checkout .
		git pull -f 2>&1
		git gc --force 2>&1
		cd -
done

cd /var/www
for i in $(ls -r vo); do echo $i; ln -sf $PWD/vo/$i $PWD/pmm/$i; done

cd /var/www
mkdir -p pmm/thupan
for i in $(ls -r thupan); do echo $i; ln -sf $PWD/thupan/$i/public $PWD/pmm/thupan/$i; done

chmod g+w -R * >/dev/null 2>&1

cd ~ #>/dev/null 2>&1