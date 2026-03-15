export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin:/usr/local/bin"

export FZF_DEFAULT_OPTS="--inline-info --reverse --height 40%"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
PROMPT='%n@%m %~ %# '

CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker fzf vi-mode git-auto-fetch web-search)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls -Al"
alias clip="xclip -selection c"
alias tb="nc termbin.com 9999"
alias tbc="tb | clip"
alias vi=$EDITOR
alias dsm="auto-standup create"
alias D="auto-standup create --work-day-starts-at-hour=24"
alias v='vault login -method oidc'
alias teleport_update_cache='tsh ls -f names >$HOME/.cache/teleport-list 2>/dev/null'
alias c='TERM=xterm-256color tsh ssh ubuntu@$(cat $HOME/.cache/teleport-list | fzf)'
alias vii="fzf --bind 'enter:become(vim {})'"
alias pr="gh pr create --fill"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

setopt POSIX_BUILTINS
setopt globdots

autoload -U +X bashcompinit && bashcompinit

export FZF_DEFAULT_OPTS="--inline-info --reverse --height 40%"
