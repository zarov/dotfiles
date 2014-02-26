#!/usr/bin/env zsh

autoload -U promptinit && promptinit
autoload -U colors && colors

setopt PROMPT_SUBST

# thank you @holman & @ehrenmurdick
if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    echo "on %{$fg_no_bold[yellow]%}$(git_prompt_info)%{$reset_color%}$(need_push)"
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null | wc -l | awk {'print $1'}
}

need_push () {
  if [[ $(unpushed) == "0" ]]
  then
    echo " [%{$fg_bold[green]%}✔︎%{$reset_color%}]"
  else
    echo " [%{$fg_bold[red]%}↑ $(unpushed)%{$reset_color%}] "
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%\/%{$reset_color%}"
}

export PROMPT=$'\n$(directory_name) $(git_dirty)\n› '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  print -Pn "\e]0;%~\a"
  set_prompt
}

# UTF8 FTW
export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
