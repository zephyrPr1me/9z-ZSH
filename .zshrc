# ============================================================
# Zsh configuration - loaded from ~/.zsh/.zshrc
# Source: all files in ~/.zsh/conf.d/ and ~/.zsh/functions/
# ============================================================

# Source completion definitions first (must be before compinit)
source ~/.zsh/completions 2>/dev/null

# Source all configuration files in order
for config_file in ~/.zsh/conf.d/*.zsh; do
    [[ -f "$config_file" ]] && source "$config_file"
done

# Source custom functions
if [[ -d ~/.zsh/functions ]]; then
    for func_file in ~/.zsh/functions/*.zsh(N); do
        [[ -f "$func_file" ]] && source "$func_file"
    done
fi