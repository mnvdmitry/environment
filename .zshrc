alias aprc="arc pr create"
alias ac="arc commit -m"
alias acb="arc branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\\)/\\1/'"
alias ah="arc push -u $(acb)"
alias alg="arc log --format \"{color.red}{commit.short}{color.yellow}{branches} {color.reset}{title} {color.cyan}{author} ({date_rfc})\""
alias al="arc pull trunk && arc rebase trunk"
alias as="arc status --short --branch"
alias aa="arc add . && as"
alias ach="arc checkout"

export VAULT_TOKEN=AQAD-qJSKhJwAAAN_jT8Lk84DUv0ouihzxzi35Q

EDITOR=nano
PS1='%1d / '
