#!/usr/bin/env bash

# git aliases
alias gall="git add -A"
alias gstat="git status"
alias gcom="git commit -m"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gget="git remote get-url origin"
alias gset="git remote set-url origin"

# pacman aliases
alias pu="sudo pacman -Syu"
alias psi="sudo pacman -Si"
alias pqi="pacman -Qi"

# Other tools
alias ls="ls --color=auto"
alias bc="bc -l"
alias serve="python -m http.server"
