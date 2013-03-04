#!/usr/bin/env zsh

autoload -U promptinit
promptinit

autoload -U colors
colors

# Colors
for color in red green yellow blue white magenta cyan; do
	eval PR_$color='%{$terminfo[bold]$fg[$color]%}'
	eval PR_LIGHT_$color='%{$fg[$color]%}'
done

#PR_NO_COLOR='%{$terminfo[sgr0]%}'

# Prompt & RightPrompt
export PS1="[$PR_LIGHT_magenta%~$PR_LIGHT_white]%# "
export RPS1="$PR_cyan%B%T%b"

# UTF8 FTW
export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
