#!/bin/bash
cd ~
c=0
while true; do
	echo
	echo "Quantidade: "$c" "$(date +%Y%m%d.%H%M%S.%N)
	echo -e "Git Fetch #1 $(date +%Y%m%d.%H%M%S.%N)\r"
	for i in $(cd ~ && ls -r */*.git | grep -i : | sed "s/://"); do cd ~ && echo $(pwd)/$i && cd $(pwd)/$i && git fetch --all 2>&1; done
	echo -e "Git Fetch #2 $(date +%Y%m%d.%H%M%S.%N)\r"
	for i in $(cd ~ && ls -r */*/*.git | grep -i : | sed "s/://"); do cd ~ && echo $(pwd)/$i && cd $(pwd)/$i && git fetch --all 2>&1; done
	echo -e "SFTP Carius Repos $(date +%Y%m%d.%H%M%S.%N)\r"
	cd ~
	#expect -c 'set timeout 3
	expect -c '
	spawn ssh carius -l deploy; expect "password:"; send "deploy\r"; expect "~$\r"; send "rm -rfv repos/* && mkdir -p repos\r"; expect "~$\r"; send "exit\r"; interact
	spawn sftp -prC deploy@carius; expect "password:"; send "deploy\r"; expect "sftp>"; send "lpwd\r"; send "put -r repos/\r"; send "bye\r"; interact'
	curl http://redmine.dsti.manaus.am.gov.br/sys/fetch_changesets?key=8aMjkoLLk40jTBaSTOai

	echo -e "SFTP Carius Repos $(date +%Y%m%d.%H%M%S.%N)\r"
	cd ~
	expect -c '
	spawn ssh pericuma -l deploy; expect "password:"; send "deploy\r"; expect "~$\r"; send "rm -rfv repos/* && mkdir -p repos\r"; expect "~$\r"; send "exit\r"; interact
	spawn sftp -prC deploy@pericuma; expect "password:"; send "deploy\r" ;expect "sftp>"; send "lpwd\r"; send "put -r repos/\r"; send "bye\r"; interact'
	curl http://pericuma.manaus.am.gov.br/sys/fetch_changesets?key=8aMjkoLLk40jTBaSTOai

	echo -e "SFTP Carius Repos $(date +%Y%m%d.%H%M%S.%N)\r"
	cd ~
	expect -c '
	spawn ssh parnamirim -l deploy; expect "password:"; send "deploy\r"; expect "~$\r"; send "rm -rfv repos/* && mkdir -p repos\r"; expect "~$\r"; send "exit\r"; interact
	spawn sftp -prC deploy@parnamirim; expect "password:"; send "deploy\r" ;expect "sftp>"; send "lpwd\r"; send "put -r repos/\r"; send "bye\r"; interact'
	curl http://parnamirim.manaus.am.gov.br/sys/fetch_changesets?key=8aMjkoLLk40jTBaSTOai

	#git_sftp.exp >/dev/null 2>&1
	echo "Sleep Time: "$c" "$(date +%Y%m%d.%H%M%S.%N)
	[[ "$c" -lt 60 ]] && sleep 45 || break
	((c++))
done
