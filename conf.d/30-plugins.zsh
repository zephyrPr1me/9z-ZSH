# 30-plugins: oh-my-zsh, fzf, zoxide, carapace и общее
ZSH_THEME=""
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

for plugin in "$ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh" "$ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"; do
    [[ -f "$plugin" ]] && source "$plugin"
done

# общие bash-функции
[[ -f ~/.bashrc.d/20-functions.sh ]] && source ~/.bashrc.d/20-functions.sh

command -v thefuck >/dev/null && eval "$(thefuck --alias)"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
command -v carapace >/dev/null && source <(carapace _carapace)

[[ -f "$ZDOTDIR/plugins/fzf-key-bindings.zsh" ]] && source "$ZDOTDIR/plugins/fzf-key-bindings.zsh"
[[ -f /usr/share/fzf/shell/completion.zsh ]] && source /usr/share/fzf/shell/completion.zsh
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
