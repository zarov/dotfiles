#!/usr/bin/env zsh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias df="df -h"
alias grep="grep --color"
alias ls="ls -Gh"
alias sl="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias paste="pastebin -d -n zarov"
alias ping="ping -c 3"
alias scrot="scrot -c -d 5"
alias tree="tree -C"
alias vim="nvim"

function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function mcd() { mkdir -p $1 && cd $1 }

function git-spull () { git pull "$@" && git submodule sync --recursive && git submodule update --init --recursive }
