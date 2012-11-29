# Add aliases
alias ll='ls -al'

# Add project aliases
alias projects='cd ~/projects'
alias gamestop='cd ~/projects/gamestop-international/Resources'
alias gonster='cd ~/projects/gonster/Resources'
alias moocho='cd ~/projects/moocho/Resources'
alias functional='cd ~/projects/FunctionalJS'
alias prelude='cd ~/projects/PreludeJS'
alias fp101='cd ~/projects/Fp101AbridgedClass'
alias dotfiles='cd ~/projects/dot-files'
alias viewful='cd ~/projects/viewful'
alias lorraine='cd ~/projects/lorrainemcgrane.com'
alias practice='cd ~/projects/practice'
alias practice-js='cd ~/projects/practice/js'

# Add binary aliases
alias specs='jasmine-node . --coffee specs'
alias watch='watchr ~/.watchr/titanium.rb'
alias watch-node='watchr ~/.watchr/node.rb'
alias watch-rails='watchr ~/.watchr/rails.rb'

# Add symlinks for nested dot-files
ln -s ~/.vim/vimrc ~/.vimrc

# MacPorts Installer addition on 2011-08-18_at_02:17:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# location of node binary
export PATH=$HOME/local/bin:$PATH

# location of haskell binaries installed using cabal
export PATH=$HOME/Library/Haskell/bin:$PATH

export PS1="[\u@\h \w]$ "

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

function titaniumRun {
  if [[ -z "$1" ]] ; then
    /Library/Application\ Support/Titanium/mobilesdk/osx/2.1.3.GA/titanium.py run --platform=iphone
  else
    /Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/titanium.py run --platform=iphone
  fi
}

function titaniumRunAndroid {
  if [[ -z "$4" ]] ; then
    python /Library/Application\ Support/Titanium/mobilesdk/osx/2.1.2.GA/android/builder.py install "$1" /opt/android/ ./ "$2" "$3"
  else
    python /Library/Application\ Support/Titanium/mobilesdk/osx/"$1"/android/builder.py install "$2" /opt/android/ ./ "$3" "$4"
  fi
}

function jslRun {
  jsl -conf ~/jsl.conf
}
