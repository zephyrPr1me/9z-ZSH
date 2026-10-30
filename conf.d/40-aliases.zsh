# 40-aliases: все алиасы
alias date="$HOME/bin/date-info"
alias file="$HOME/bin/file-info"
# Навигация
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias back='cd -'
alias md='mkdir -p'
alias y='yazi'

# Частые команды
alias o='opencode'
alias v='nvim'
alias co='code'
alias nr='nim c -r'
alias router-reboot='reboot-router'

# Git / Docker
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dce='docker compose exec'

# Мелочи
alias sudo='sudo '
alias ur='uv run'
alias h='history'

# Корзина вместо удаления (trash-cli; переопределяет rm -i из oh-my-zsh)
alias rm='trash-put'
alias rml='trash-list'
alias rmr='trash-restore'
alias rme='trash-empty 30'
alias zshs='cd ~/.config/zsh/conf.d/'
alias zm='zoomer'

# размер диска и крупные директории
alias diskusage='dusage'

# Modern replacements (fd / eza)
# alias grep='rg' и alias find='fd' убраны: rg молча игнорирует скрытые и
# gitignore-файлы и иначе трактует флаги (-P, -E), а fd несовместим
# с синтаксисом find. Короткие вызовы — отдельно:
alias f='fd'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -lah --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=2 -a --icons'

# Neovim дистрибутивы (NVIM_APPNAME изолирует конфиги и данные)
alias v='nvim'
alias vl='NVIM_APPNAME=nvim-lazyvim nvim'
alias vc='NVIM_APPNAME=nvim-nvchad nvim'
alias va='NVIM_APPNAME=nvim-astro nvim'
