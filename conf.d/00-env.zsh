# 00-env: окружение, PATH, XDG
export EDITOR=nvim
export VISUAL=nvim
export SYSTEMD_PAGER=

export ZSH="$HOME/.oh-my-zsh"

# XDG-состояние zsh (вместо мусора в $HOME)
export HISTFILE="$HOME/.local/share/zsh/history"
[[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-$HOST-$ZSH_VERSION"
[[ -d "${ZSH_COMPDUMP:h}" ]] || mkdir -p "${ZSH_COMPDUMP:h}"

# PATH через массив path: typeset -U гарантирует уникальность,
# поэтому reload/повторный source не размножает записи
typeset -U path
path=("$HOME/.lmstudio/bin" $path)
path=("$HOME/.local/opt/nim-2.2.13/bin" $path)
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
path=("$JAVA_HOME/bin" $path)

# свои комплишены первыми в fpath
fpath=("$ZDOTDIR/completions" $fpath)
export TYPST_INSTALL="/home/eliot/.typst"
path=("$TYPST_INSTALL/bin" $path)
