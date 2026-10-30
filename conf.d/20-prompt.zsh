# 20-prompt: промпт
_prompt_pwd() {
    print -D $PWD
}

_prompt_ip() {
    local ip
    # awk вместо grep -P: алиас grep='rg' ломал вызов (rg без PCRE2)
    ip=$(ip -4 addr show scope global 2>/dev/null | awk '/inet /{split($2,a,"/"); print a[1]; exit}')
    echo "${ip:-no-ip}"
}

# Кэш для промпта: ip и git считаются один раз перед отрисовкой,
# а не на каждый Enter через PROMPT_SUBST
PROMPT_IP=no-ip
PROMPT_GIT=
PROMPT_GITB=
_prompt_render() {
    PROMPT_IP=$(_prompt_ip)
    PROMPT_GITB=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n "$PROMPT_GITB" ]] && PROMPT_GIT=" %F{magenta}($PROMPT_GITB)%f" || PROMPT_GIT=
}
add-zsh-hook precmd _prompt_render

# --- Варианты промпта ---
# Переключение алиасами: p-full p-compact p-minimal p-two p-power
# Выбор запоминается в $ZDOTDIR/.prompt-variant и восстанавливается
# в новых терминалах. p-next — циклически, p-show — текущий.

_prompt_p_full() {
    PROMPT=$'%F{240}[%D{%H:%M:%S}]%f %F{cyan}%B%n%b%f@%F{green}%B%M%b%f [%F{yellow}%B$PROMPT_IP%b%f] %F{blue}%B$(_prompt_pwd)%b%f$PROMPT_GIT\n%(?.%F{green}%B.%F{red}%B)❯%b%f '
}

_prompt_p_compact() {
    PROMPT=$'%F{cyan}%n%f@%F{green}%m%f %F{blue}%B$(_prompt_pwd)%b%f$PROMPT_GIT %(?.%F{green}%B.%F{red}%B)❯%b%f '
}

_prompt_p_minimal() {
    PROMPT=$'%F{blue}%B$(_prompt_pwd)%b%f %(?.%F{green}%B.%F{red}%B)❯%b%f '
}

_prompt_p_two() {
    PROMPT=$'%F{240}%D{%H:%M}%f %F{blue}%B$(_prompt_pwd)%b%f$PROMPT_GIT\n%(?.%F{green}%B.%F{red}%B)❯%b%f '
}

# powerline-сегменты; нужен шрифт с глифами Nerdfont (стрелка \uE0B0)
_prompt_p_power() {
    PROMPT=$'%F{white}%K{blue} %n@%m %f%F{blue}%K{238}\uE0B0 %~ %f%F{238}%K{magenta}\uE0B0 $PROMPT_GITB %f%F{magenta}%K{240}\uE0B0 $PROMPT_IP %f%F{240}%k\uE0B0 \n%(?.%F{green}.%F{red})❯%f '
}

# как дефолтный промпт macOS: %n@%m 1~ %# (без цветов; % у юзера, # у root)
_prompt_p_mac() {
    PROMPT=$'%n@%m %1~ %# '
}

typeset -g _PROMPT_CURRENT
typeset -ga _PROMPT_ALL=(full compact minimal two-line powerline mac)

_prompt_use() {
    case "$1" in
        full)     _prompt_p_full ;;
        compact)  _prompt_p_compact ;;
        minimal)  _prompt_p_minimal ;;
        two-line) _prompt_p_two ;;
        powerline) _prompt_p_power ;;
        mac)      _prompt_p_mac ;;
        *) echo "Неизвестный вариант промпта: $1"; return 1 ;;
    esac
    _PROMPT_CURRENT="$1"
    print -r -- "$1" > "$ZDOTDIR/.prompt-variant" 2>/dev/null
}

_prompt_cycle() {
    local i=${_PROMPT_ALL[(Ie)${_PROMPT_CURRENT:-full}]}
    local next=${_PROMPT_ALL[(( (i % ${#_PROMPT_ALL}) + 1 ))]}
    _prompt_use "$next"
    print -P "промпт: %F{yellow}$next%f"
}

alias p-full='_prompt_use full'
alias p-compact='_prompt_use compact'
alias p-minimal='_prompt_use minimal'
alias p-two='_prompt_use two-line'
alias p-power='_prompt_use powerline'
alias p-mac='_prompt_use mac'
alias p-next='_prompt_cycle'
alias p-show='print -r -- "промпт: $_PROMPT_CURRENT"'

# при старте применяем сохранённый выбор
if [[ -f "$ZDOTDIR/.prompt-variant" ]]; then
    _PROMPT_SAVED=$(<"$ZDOTDIR/.prompt-variant")
    _prompt_use "$_PROMPT_SAVED"
fi
