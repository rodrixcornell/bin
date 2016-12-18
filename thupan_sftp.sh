#!/bin/bash

cd $(pwd)

echo $(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$LIGHT_RED'"$(__git_ps1 "(%s) ")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$LIGHT_YELLOW'"$(__git_ps1 "(%s) ")
    else echo "'$LIGHT_GREEN'"$(__git_ps1 "(%s) ")
    fi)

echo $(__git_ps1 "%s")
