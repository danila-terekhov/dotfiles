# .bashrc
# If not running interactively, don"t do anything
[[ $- != *i* ]] && return

bind "set completion-ignore-case on"

set -o noclobber # dont override files

export PATH="$PATH:/usr/local/bin:"
export PATH="$PATH:/home/poiza/.local/bin:"
export HISTCONTROL=ignoredups # ignore duplicates in history
export BROWSER=qutebrowser
export EDITOR=nvim
export EMAIL=poiza@list.ru
export MAIL=$HOME/Mail/

alias shut="sudo shutdown -P now"
alias reb="sudo shutdown -r now"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -Al"
alias xba="xbacklight"
alias vi=nvim
alias warcraft3=wine\ "/home/poiza/.wine/drive_c/Program\ Files\ \(x86\)/Warcraft\ III/war3.exe"\ -opengl
alias warcraft3roc=wine\ "/home/poiza/.wine/drive_c/Program\ Files\ \(x86\)/Warcraft\ III/Warcraft\ III.exe"\ -opengl


#source /usr/share/git/completion/git-completion.bash

(cat ~/.cache/wal/sequences &) # wal theme

blue="\[$(tput setaf 6)\]"
gray="\[$(tput setaf 249)\]"
dark_gray="\[$(tput setaf 240)\]"
reset="\[$(tput sgr0)\]"
PS1="${dark_gray}\$?${blue}[\W]${gray}λ${reset} "
