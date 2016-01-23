#!/bin/bash

# use vim key bindings
set -o vi

# Aliases
alias ll='ls -al'

# My project aliases
alias projects='cd ~/projects'
alias dotfiles='cd ~/.dotfiles'
alias lorraine='cd ~/projects/lorrainemcgrane'

# Binary aliases
alias specs='jasmine-node . --coffee specs'
alias watch-node='watchr ~/.watchr/node.rb'
alias watch-rails='watchr ~/.watchr/rails.rb'

# CLI aliases
alias eIos='tns run ios --emulator'
alias eAndroid='tns run android --emulator'

# location of local binaries
export PATH=$HOME/local/bin:$PATH

# set java home environment variable
export JAVA_HOME=/usr/libexec/java_home

# set android sdk environment variable
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# nvm (version manager for node.js)
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# location of haskell binaries installed using cabal
export PATH=$HOME/Library/Haskell/bin:$PATH

# format the command line prompt
export PS1="[\u@\h \w]$ "

###-tns-completion-start-###
if [ -f /Users/ericschmitt/.tnsrc ]; then 
    source /Users/ericschmitt/.tnsrc 
fi
###-tns-completion-end-###
