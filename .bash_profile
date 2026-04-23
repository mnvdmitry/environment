# Молчок Apple про "default interactive shell is now zsh"
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew env (PATH, MANPATH, INFOPATH, HOMEBREW_*)
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Подгружаем интерактивный конфиг
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
