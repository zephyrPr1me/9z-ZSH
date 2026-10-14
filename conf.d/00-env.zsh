# 00-env: окружение, PATH, XDG
export EDITOR=vim
export VISUAL=vim
export SYSTEMD_PAGER=

export ZSH="$HOME/.oh-my-zsh"

# XDG-состояние zsh (вместо мусора в $HOME)
export HISTFILE="$HOME/.local/share/zsh/history"
[[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-$HOST"
[[ -d "${ZSH_COMPDUMP:h}" ]] || mkdir -p "${ZSH_COMPDUMP:h}"

# PATH-добавки (раньше были в середине .zshrc)
export PATH="$PATH:$HOME/.lmstudio/bin"
export PATH="$HOME/.local/opt/nim-2.2.13/bin:$PATH"

# свои комплишены первыми в fpath
fpath=("$ZDOTDIR/completions" $fpath)
