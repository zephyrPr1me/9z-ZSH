# 10-options: опции, completion, история
setopt PROMPT_SUBST
autoload -Uz compinit && compinit -d "$ZSH_COMPDUMP"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE EXTENDED_HISTORY
HISTORY_IGNORE="(ls|ll|la|cd|exit|clear|history|pwd)"

autoload -Uz add-zsh-hook
