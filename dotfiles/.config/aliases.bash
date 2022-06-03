#!/usr/bin/env bash

# git
alias gall="git add -A"
alias gstat="git status"
alias gcom="git commit -m"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gget="git remote get-url origin"
alias gset="git remote set-url origin"

# pacman
alias pu="sudo pacman -Syu"
alias psi="sudo pacman -Si"
alias pqi="pacman -Qi"

# systemctl
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias senable="sudo systemctl enable"
alias sdisable="sudo systemctl disable"
alias sstatus="sudo systemctl status"
alias slist="sudo systemctl list-units"

# Other tools
alias ls="ls --color=auto"
alias bc="bc -l"
alias serve="python -m http.server"
