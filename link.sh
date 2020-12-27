#!/bin/bash
# So, this and all.sh should be executed from the parent folder
# unlink with the same command, adding -D flag
stow "dotfiles" -t $HOME
