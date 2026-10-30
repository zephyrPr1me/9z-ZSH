# 50-functions: функции и хуки
unalias please 2>/dev/null
please() { sudo $(fc -ln -1) }

unalias reload 2>/dev/null
reload() { exec zsh }  # чистый перезапуск: повторный source размножал бы PATH

cc() {
    local src="${1:-main.c}"
    local out="${src%.c}"
    gcc -Wall -Wextra -O3 -march=native "$src" -o "$out"
}

cppc() {
	local src="${1:-main.c}"
	local out="${src%.c}"
	g++ -std=c++20 -Wall -Wextra -Wshadow -g "$src" -o "$out"
}

vf() { local f && f="$(fzf)" && nvim "$f"; }
cn() {
    if (( $# < 1 )); then
        echo "Usage: crun <file.c> [args...]"
        return 1
    fi

    local src="$1"
    shift

    if [[ ! -f "$src" ]]; then
        echo "Error: file not found: $src"
        return 1
    fi

    local exe="build/${src:t:r}"

    mkdir -p build || return 1

    gcc -Wall -Wextra -Wpedantic -std=c11 -O2 -g \
        "$src" -o "$exe" || return 1

    "./$exe" "$@"
}
# Git / Docker
unalias gcl 2>/dev/null  # из oh-my-zsh git-плагина; заменяем на clone+cd
gcl() {
    local err rc dir
    err=$(mktemp) || return 1
    LC_ALL=C git clone --recurse-submodules "$@" 2> >(tee "$err" >&2); rc=$?
    dir=$(sed -n "s/.*Cloning into '\([^']*\)'.*/\1/p" "$err" | head -1)
    command rm -f "$err"
    (( rc != 0 )) && return $rc
    [[ -n "$dir" && -d "$dir" ]] && cd "$dir"
}

# Инфоблок о директории по запросу, а не хуком на каждый cd:
# глоб * в огромных каталогах (~, /usr) тормозил каждый переход.
# Не называть di: алиас docker images из OMZ
dirinfo() {
    local -a dirs files
    dirs=( */(ND) )
    files=( *(ND.) )
    print -P "%F{blue}▸ %~%f"
    print -P "  %F{240}файлов:%f $(( ${#files[@]} )) %F{240}папок:%f $(( ${#dirs[@]} ))%f"
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        print -P "  %F{240}git:%f %F{magenta}$(git rev-parse --abbrev-ref HEAD 2>/dev/null)%f$(git status --porcelain 2>/dev/null | head -1 | grep -q . && print ' %F{yellow}*%f')"
    fi
}

cd() {
    local target
    if [[ $# -eq 0 ]]; then
        builtin cd
        return
    fi
    target="$1"
    if [[ "$target" == .. || "$target" == ~ || "$target" == /* || "$target" == ./* || "$target" == ../* || "$target" == ~/* || -d "$target" ]]; then
        builtin cd "$@"
        return
    fi
    z "$target" 2>/dev/null || builtin cd "$@"
}
