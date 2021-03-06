#!/usr/bin/env zsh

# NVM PATH
export NVM_DIR=$HOME/.nvm
# MacOS
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
# Linux
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.nvm/bash_completion" ] && . "$HOME/.nvm/bash_completion"

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Editor
export EDITOR=/usr/local/bin/nvim

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias df="df -h"
alias du="du -h"
alias grep="grep --color"
alias cat="bat"
alias ls="exa -Gh"
alias sl="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias ping="ping -c 3"
alias vim="nvim"
alias tmux="tmux -2"

function mcd() { mkdir -p $1 && cd $1 }

# Auto cd
setopt auto_cd

# Good ln -s
setopt CHASE_LINKS

# no rm *
setopt RM_STAR_WAIT
setopt NO_RM_STAR_SILENT

# Best word removing
autoload -U select-word-style
select-word-style bash

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
export HISTFILE HISTSIZE SAVEHIST
setopt histverify

local os host

# Set default umask to 557
umask 022

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt
eval "$(starship init zsh)"

# COMPLETION
autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# Global completion behavior
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _prefix _approximate
zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' use-ip true

# Use 'ps -au$USER' for fetch user process list
zstyle ':completion:*:processes' command 'ps -au$USER'

zstyle ':completion:*' ignore-parents parent pwd

# few simple completion definitions
compdef _hosts mtr
compdef _hosts rdesktop
compdef _gnu_generic sort

# Some zstyle specific to vi/vim
zstyle ':completion:*:*:vi*:*' file-sort modification
zstyle ':completion:*:*:vi*:*' ignored-patterns '*.(o|class)'

# Message
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Kill
zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select

# Options
setopt correct
setopt always_to_end

zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*:approximate:*' max-errors par 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# NPM COMPLETION
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi

# TMUX PROFILES
function tm() {
  if tmux has -t "$1" &> /dev/null
  then
    tmux attach -t "$1"
    exit 0
  fi

  case "$1" in
    "itowns")
      tmux new -s itowns -c $HOME/Workspace/itowns -n nvim nvim \; \
        neww -n ci \; \
        splitw -h -p 50 npm run debug \; \
        splitw -v -p 50 npm run test-unit -- -- --watch \; \
        selectp -t 0 \;
      ;;
    "entwine")
      tmux new -s entwine -c $HOME/Workspace/data-itowns/itowns-entwine -n ci npm run start \; \
        splitw -h -p 50 \; \
        neww -n nvim nvim \;
      ;;
    "jekyll")
      tmux new -s jekyll -c $HOME/Workspace/zarov.github.io/ -n jekyll bundle exec jekyll serve \; \
        splitw -h -p 50 \; \
        neww -n nvim nvim \;
      ;;
    *)
      tmux
      ;;
  esac
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
