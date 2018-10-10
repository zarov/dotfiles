#!/usr/bin/env zsh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias df="df -h"
alias grep="grep --color"
alias ls="ls -Gh --color=always"
alias sl="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias paste="pastebin -d -n zarov"
alias ping="ping -c 3"
alias scrot="scrot -c -d 5"
alias tree="tree -C"
alias vim="nvim"
alias python="python3"

function mcd() { mkdir -p $1 && cd $1 }
