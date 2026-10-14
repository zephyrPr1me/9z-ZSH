# Точка входа zsh (ZDOTDIR=$HOME/.config/zsh).
# Вся логика — в conf.d/NN-*.zsh
for _f in "$ZDOTDIR"/conf.d/*.zsh(N); do
  source "$_f"
done
unset _f
