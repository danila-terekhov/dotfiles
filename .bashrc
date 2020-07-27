# .bashrc
# If not running interactively, don"t do anything
[[ $- != *i* ]] && return

bind "set completion-ignore-case on"

set -o noclobber # dont override files

export PATH="$PATH:/usr/local/bin:"
export PATH="$PATH:/home/poiza/.local/bin:"
export HISTCONTROL=ignoredups # ignore duplicates in history
export LESSHISTFILE="/dev/null"
export BROWSER=qutebrowser
export EDITOR=nvim
export EMAIL=poiza@list.ru
export MAIL=$HOME/Mail/

alias shut="sudo shutdown -P now"
alias reb="sudo shutdown -r now"
alias pc="xbps-query -l | wc -l"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -Al"
alias rm="rm -rf" # :)
alias clip="xclip -selection c"
alias tb="nc termbin.com 9999"
alias tbc="tb | clip"
alias vi=nvim
alias xba=xbacklight
alias mw=openmw

source ~/.config/git_completions

(cat ~/.cache/wal/sequences &) # wal theme

blue="\[$(tput setaf 6)\]"
gray="\[$(tput setaf 249)\]"
dark_gray="\[$(tput setaf 240)\]"
reset="\[$(tput sgr0)\]"
PS1="${dark_gray}\$?${blue}[\W]${gray}λ${reset} "
