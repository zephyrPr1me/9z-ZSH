# 20-prompt: промпт
_prompt_pwd() {
    print -D $PWD
}

_prompt_ip() {
    local ip
    ip=$(ip -4 addr show scope global 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
    echo "${ip:-no-ip}"
}

_prompt_git() {
    command -v git >/dev/null || return
    local b
    b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n "$b" ]] && echo " %F{magenta}($b)%f"
}

PROMPT=$'%F{240}[%D{%H:%M:%S}]%f %F{cyan}%B%n%b%f@%F{green}%B%M%b%f [%F{yellow}%B$(_prompt_ip)%b%f] %F{blue}%B$(_prompt_pwd)%b%f$(_prompt_git)\n%(?.%F{green}%B.%F{red}%B)❯%b%f '
