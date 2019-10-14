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
function cjd() { cd ~/Documents/*/*/$1* } # https://johnnydecimal.com/concepts/working-at-the-terminal/

function git-branch-clean() {
	for BRANCH in `git branch | grep -v HEAD`;
	do
		git show --format="%C(cyan)$BRANCH%Creset has last been update %C(yellow)%cr%Creset by %Cgreen%an%Creset: %n%s." -s $BRANCH
		read "REPLY?Delete this branch ? y/[N] "
		if [[ "$REPLY" =~ ^[Yy]$ ]];
		then
			git branch -D $BRANCH
		fi
		echo  \\n
	done
}
