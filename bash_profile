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

# location of local binaries
export PATH=$HOME/local/bin:$PATH

# location of nvm binary (version manager for node.js)
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# location of haskell binaries installed using cabal
export PATH=$HOME/Library/Haskell/bin:$PATH

export PS1="[\u@\h \w]$ "

function runTiAppIphone {
  if [[ -z "$1" ]] ; then
    $HOME/Library/Application\ Support/Titanium/mobilesdk/osx/3.1.3.GA/titanium.py run --platform=iphone
  else
    $HOME/Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/titanium.py run --platform=iphone
  fi
}

function buildTiAppAndroid {
  DROIDX='015DAA2D13035021'
  S3='ed8e6a6e'
  ANDROID_SDK=/opt/android-sdk/
  if [[ -z "$3" ]] ; then
    python $HOME/Library/Application\ Support/Titanium/mobilesdk/osx/3.1.3.GA/android/builder.py install "$1" $ANDROID_SDK ./ "$2" $S3
  else
    python $HOME/Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/android/builder.py install "$2" $ANDROID_SDK ./ "$3" $S3
  fi
}

function jslRun {
  jsl -conf ~/jsl.conf
}

