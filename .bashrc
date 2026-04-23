# ~/.bashrc — интерактивный bash
# shellcheck shell=bash

# Молчок Apple про "default interactive shell is now zsh"
# (дублируется в .bash_profile — для случаев, когда .bashrc запускается напрямую)
export BASH_SILENCE_DEPRECATION_WARNING=1

# Если шелл не интерактивный — ничего не делаем
case $- in
    *i*) ;;
      *) return;;
esac

# ── History ──────────────────────────────────────────────────────────────────
HISTCONTROL=ignoreboth        # не писать дубликаты и строки с ведущим пробелом
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend            # дописывать, а не перезаписывать

# Обновлять LINES/COLUMNS после каждой команды
shopt -s checkwinsize

# ── PATH / env ───────────────────────────────────────────────────────────────
# Yandex Cloud CLI (если установлен)
if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then
    . "$HOME/yandex-cloud/path.bash.inc"
fi
if [ -f "$HOME/yandex-cloud/completion.bash.inc" ]; then
    . "$HOME/yandex-cloud/completion.bash.inc"
fi

export EDITOR="code --wait"

# ── Aliases ──────────────────────────────────────────────────────────────────
# OpenCode с Yandex CA
alias opencode='NODE_EXTRA_CA_CERTS="$HOME/.config/opencode/YandexInternalRootCA.crt" opencode'

# Arc aliases
alias aprc="arc pr create"
alias ac="arc commit -m"
alias as="arc submit -m"
alias acb="arc branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"
alias ah='arc push -u "$(acb)"'
alias alg='arc log --format "{color.red}{commit.short}{color.yellow}{branches} {color.reset}{title} {color.cyan}{author} ({date_rfc})"'
alias al="arc pull trunk && arc rebase trunk"
alias as="arc status --short --branch"
alias aa="arc add . && as"
alias ach="arc checkout"

# ── Prompt ───────────────────────────────────────────────────────────────────
# Эквивалент zsh-промпта `%F{cyan}%1d /%f ` — cyan basename текущей папки + " /"
PS1='\[\e[36m\]\W /\[\e[0m\] '

# ── Completions & patches ────────────────────────────────────────────────────
# Wizard: shell patches (NODE_EXTRA_CA_CERTS, alias wizard)
[ -f "$HOME/.wizard/shell.rc" ] && . "$HOME/.wizard/shell.rc"

# OpenClaw completion
if [ -f "$HOME/.openclaw/completions/openclaw.bash" ]; then
    . "$HOME/.openclaw/completions/openclaw.bash"
fi

# bash-completion (если установлен через brew)
if [ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]; then
    . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# ── Ghostty shell integration ────────────────────────────────────────────────
if [ -n "$GHOSTTY_RESOURCES_DIR" ] && \
   [ -f "$GHOSTTY_RESOURCES_DIR/shell-integration/bash/ghostty.bash" ]; then
    builtin source "$GHOSTTY_RESOURCES_DIR/shell-integration/bash/ghostty.bash"
fi
