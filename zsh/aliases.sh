#!/bin/bash

# Git aliases
alias gs="git status"
alias gcm="git commit -m "
alias gpl="echo 'git pull...' && git pull"
alias gph="echo 'git push...' && git push"
alias gco="git checkout "
alias gcb="git checkout -b "
alias gbr="git branch "

# Common navigation aliases
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -alF"
alias ls="lsd --header --color=always --group-directories-first"
alias lt="ls --tree"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Clipboard
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Programs
alias da="direnv allow"
alias dc="docker compose"
alias doclean="docker image prune -a"
alias tf="terraform"

# CLI Power tools
# Article: https://deepu.tech/rust-terminal-tools-linux-mac-windows-fish-zsh/
alias bat="bat"
alias cat="bat"
alias cp="xcp"
alias du="dust"
alias grep="rg"
alias tree="broot"
alias ps="procs"
alias lg="lazygit"
alias ld="lazydocker"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

