# Aliases
alias ll='ls -al'

# My project aliases
alias projects='cd ~/projects'
alias dotfiles='cd ~/projects/dotfiles'
alias viewful='cd ~/projects/viewful'
alias lorraine='cd ~/projects/lorrainemcgrane.com'
alias practice='cd ~/projects/practice'
alias practice-js='cd ~/projects/practice/js'

# loop/recur project aliases
alias redbumper='cd ~/projects/RedBumper/Resources'
alias redbumper-run='runTiAppIphone'
alias redbumper-build='buildTiAppAndroid RedBumper com.redbumper.dealerapp'
alias moocho='cd ~/projects/moocho/Resources'
alias moocho-run='runTiAppIphone 2.1.2.GA'
alias moocho-build='buildTiAppAndroid 2.1.2.GA Moocho com.moocho.moocho'
alias weichert='cd ~/projects/weichert/Resources'
alias weichert-build='buildTiAppAndroid 3.0.0.GA Weichert com.looprecur.weichert'
alias gamestop='cd ~/projects/gamestop-international/Resources'
alias gonster='cd ~/projects/gonster/Resources'
alias functional='cd ~/projects/FunctionalJS'
alias prelude='cd ~/projects/PreludeJS'
alias fp101='cd ~/projects/Fp101AbridgedClass'

# Binary aliases
alias specs='jasmine-node . --coffee specs'
alias watch='watchr ~/.watchr/titanium.rb'
alias watch-node='watchr ~/.watchr/node.rb'
alias watch-rails='watchr ~/.watchr/rails.rb'
alias titanium.py='/Library/Application\ Support/Titanium/mobilesdk/osx/3.0.2.GA/titanium.py'
alias ios_builder='/Library/Applicaiton\ Support/Titanium/mobilesdk/osx/3.0.2.GA/iphone/builder.py'

# Add symlink for nested vimrc (if not already created)
if ! [ -L ~/.vimrc ]; then
  ln -s ~/.vim/vimrc ~/.vimrc
fi

# MacPorts Installer addition on 2011-08-18_at_02:17:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# location of node binary
export PATH=$HOME/local/bin:$PATH

# location of haskell binaries installed using cabal
export PATH=$HOME/Library/Haskell/bin:$PATH

# location of android platform tools
export PATH=$HOME/projects/android-sdk/platform-tools:$PATH

export PS1="[\u@\h \w]$ "

# Android NDK environment variable for native android mobile development
export ANDROID_NDK=~/projects/android-ndk-r8d

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
    /Library/Application\ Support/Titanium/mobilesdk/osx/3.0.2.GA/titanium.py run --platform=iphone
  else
    /Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/titanium.py run --platform=iphone
  fi
}

function buildTiAppAndroid {
  DROIDX='015DAA2D13035021'
  ANDROID_SDK=$HOME/projects/android-sdk/
  if [[ -z "$3" ]] ; then
    python /Library/Application\ Support/Titanium/mobilesdk/osx/3.1.0.GA.Continuous/android/builder.py install "$1" $ANDROID_SDK ./ "$2" $DROIDX
  else
    python /Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/android/builder.py install "$2" $ANDROID_SDK ./ "$3" $DROIDX
  fi
}

function jslRun {
  jsl -conf ~/jsl.conf
}
