# .bashrc

# If not running interactively, don"t do anything
[[ $- != *i* ]] && return

bind "set completion-ignore-case on"

set -o noclobber

export PATH="$PATH:/usr/local/bin:"
export PATH="$PATH:/home/poiza/.local/bin:"
export HISTCONTROL=ignoredups
export BROWSER=qutebrowser
export EDITOR=nvim
export EMAIL=poiza@list.ru
export MAIL=$HOME/Mail/



alias shut="sudo shutdown -P now"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -al"
alias vi=nvim

#source /usr/share/git/completion/git-completion.bash

(cat ~/.cache/wal/sequences &)

blue="\[$(tput setaf 6)\]"
gray="\[$(tput setaf 249)\]"
dark_gray="\[$(tput setaf 240)\]"
reset="\[$(tput sgr0)\]"
PS1="${dark_gray}\$?${blue}[\W]${gray}λ${reset} "
