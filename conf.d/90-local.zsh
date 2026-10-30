# 90-local: локальные переопределения для этой машины.
# Не коммитить. Пример:
# export ROUTER_IP="192.168.1.1"
# alias o='opencode --model opus'

# Быстрый инфоблок терминала при открытии сессии
if [[ -t 1 && -z "$FASTFETCH_DISABLED" ]]; then
    macchina
fi
# mth - theme manager
source ~/.config/zsh/functions/mth

# PNPM PATH
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# zoxide init
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# Herme's Agent
command -v thefuck >/dev/null && eval "$(thefuck --alias)"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
command -v carapace >/dev/null && source <(carapace _carapace)

# fzf-key-bindings - check both locations
[[ -f ~/.zsh/plugins/fzf-key-bindings.zsh ]] && source ~/.zsh/plugins/fzf-key-bindings.zsh
[[ -f ~/.config/zsh/plugins/fzf-key-bindings.zsh ]] && source ~/.config/zsh/plugins/fzf-key-bindings.zsh

# zsh-syntax-highlighting (must be last)
[[ -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
    source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
