# 40-aliases: все алиасы
alias date="$HOME/bin/date-info"
alias file="$HOME/bin/file-info"
alias zoomer="$HOME/probe/zoomer/zoomer"

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
