# 10-options: опции, completion, история
# compinit здесь не вызываем: oh-my-zsh.sh делает это сам с кэшем
# и compaudit, повторный вызов только замедлял старт.
setopt PROMPT_SUBST
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE EXTENDED_HISTORY
HISTORY_IGNORE="(ls|ll|la|cd|exit|clear|history|pwd)"

autoload -Uz add-zsh-hook
