#!/bin/bash

# use vim key bindings
set -o vi

# Aliases
alias ll='ls -al'

# My project aliases
alias projects='cd ~/projects'
alias dotfiles='cd ~/.dotfiles'
alias lorraine='cd ~/projects/lorrainemcgrane.com'
alias practice='cd ~/projects/practice'
alias practice-js='cd ~/projects/practice/js'

# Binary aliases
alias specs='jasmine-node . --coffee specs'
alias watch='watchr ~/.watchr/titanium.rb'
alias watch-node='watchr ~/.watchr/node.rb'
alias watch-rails='watchr ~/.watchr/rails.rb'
alias titanium.py='/Library/Application\ Support/Titanium/mobilesdk/osx/3.0.2.GA/titanium.py'
alias ios_builder='/Library/Applicaiton\ Support/Titanium/mobilesdk/osx/3.0.2.GA/iphone/builder.py'
alias ti='titanium'

# MacPorts Installer addition on 2011-08-18_at_02:17:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# location of node binary
export PATH=$HOME/local/bin:$PATH

# location of haskell binaries installed using cabal
export PATH=$HOME/Library/Haskell/bin:$PATH

# location of android tools
export PATH=/opt/android-sdk/platform-tools:$PATH
export PATH=/opt/android-sdk/tools:$PATH

export PS1="[\u@\h \w]$ "

# Android NDK environment variable for native android mobile development
export ANDROID_NDK=/opt/android-ndk
export ANDROID_SDK=/opt/android-sdk

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

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
