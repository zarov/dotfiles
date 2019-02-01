#!/usr/bin/env zsh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias df="df -h"
alias du="du -h"
alias grep="grep --color"
alias ls="ls -Gh"
alias sl="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias paste="pastebin -d -n zarov"
alias ping="ping -c 3"
alias vim="nvim"

function mcd() { mkdir -p $1 && cd $1 }
function note() { vim -c "Goyo" ~/Workspace/notes/$*.md }
function notels() { ls -c ~/Workspace/notes/ | grep "$*" }
