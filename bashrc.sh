#!/bin/bash

### GIT
# Preto        30
# Vermelho     31
# Verde        32
# Marrom       33
# Azul         34

#if [ -f /etc/bash_completion.d/git ]; then
#  . /etc/bash_completion.d/git
#fi
#complete -o bashdefault -o default -o nospace -F _git
#complete -o bashdefault -o default -o nospace -F _git git
#complete -o bashdefault -o default -o nospace -F _gitk gitk

#export no_proxy="local,host,localhost,127.0.0.1,10.10.*,172.19.*,*.manaus.am.gov.br,.manaus.am.gov.br,172.19.10.0/23,192.168.56.0/24"
#export no_proxy="local,host,localhost,127.0.0.1"
#export https_proxy=http://172.19.10.1:3128
#export http_proxy=http://172.19.10.1:3128
#export ftp_proxy=http://172.19.10.1:3128

#export SQLPATH="$ORACLE_HOME"
#export TNS_ADMIN="$HOME/oracle_client/network/admin"

export RLWRAP_EDITOR="nano %L"

RED="\[\033[31m\]"
LIGHT_RED="\[\033[01;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[01;32m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[01;33m\]"
BLUE="\[\033[34m\]"
LIGHT_BLUE="\[\033[01;34m\]"
MAGENTA="\[\033[0;35m\]"
LIGHT_MAGENTA="\[\033[01;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[01;36m\]"
GRAY="\[\033[0;37m\]"
LIGHT_GRAY="\[\033[01;37m\]"
CLEAN="\[\033[00m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD


#PROMPT_COMMAND="echo -n [$(date +%H:%M:%S)]"

#export PS1='${debian_chroot:+($debian_chroot)}\t \d \[\033[01;33m\][\h]\[\033[00m\]@ \[\033[01;32m\][\u]\[\033[00m\]: \[\033[01;36m\][\w]\n\[\033[31m\]$(__git_ps1 "(%s) ")\[\033[00m\]\[\033[07;37m\]->\[\033[00m\] '

color_prompt=yes
if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\h\[\033[00m\]@\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;36m\]\w\n\[\033[31m\]$(__git_ps1 "(%s) ")\[\033[00m\]\[\033[07;37m\]->\[\033[00m\] '
	PS1='\[\033[44m\]${debian_chroot:+($debian_chroot)}[\t \d]'$CLEAN$LIGHT_BLUE' [term \l]'$LIGHT_YELLOW' \h'$CLEAN'@'$LIGHT_GREEN'[\u]'$CLEAN':'$LIGHT_CYAN'[\w]\n'$CLEAN
	PS1=$PS1'$(
	if [[ $(__git_ps1) =~ \*\)$ ]]
	then echo "'$LIGHT_RED'"$(__git_ps1 "(%s) ")
	elif [[ $(__git_ps1) =~ \+\)$ ]]
	then echo "'$LIGHT_YELLOW'"$(__git_ps1 "(%s) ")
	else echo "'$LIGHT_GREEN'"$(__git_ps1 "(%s) ")
	fi)'$LIGHT_GRAY'-> '$CLEAN
else
	PS1='${debian_chroot:+($debian_chroot)}\t \d [\h]@ [\u]: [\w]\n$(__git_ps1 "(%s) ")-> '
fi
unset color_prompt

case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h@\u: \w\a\]$PS1"
	;;
*)
	;;
esac

#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# my include bashrc.sh if it exists
#if [ -f ~/bin/bash_aliases.sh ]; then
#    . ~/bin/bash_aliases.sh
#fi

# Oracle SET
if [[ "which sqlplus" ]]; then
	export TNS_ADMIN=${HOME}/network/admin
	export NLS_LANG=$($HOME/bin/nls_lang.sh)
	[[ "which rlwrap" ]] && alias sqlplus='rlwrap -b "" -f ${HOME}/sql/dict.sql sqlplus'
fi

# Token Redmine
export API_KEY_REDMINE="0e30db1356a0c996d89ca23554cac854c22e6e46"

