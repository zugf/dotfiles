#!/bin/bash

DOTFILEDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dotfiles=$(ls -1 -A $DOTFILEDIR | grep -v -e .git$ -e .gitignore$ -e bootstrap -e README.md 2> /dev/null)

make_symlinks() {
  for dotfile in $1; do
    fullfile="$2$dotfile"
    if ! [ -L "$HOME/$fullfile" ] &&  [ -d "$HOME/$fullfile" ] ; then
      # if it is a directory that is not symlinked, descend    
      entries=$(ls -1 -A $DOTFILEDIR/$fullfile)
      make_symlinks "${entries[@]}" "$fullfile/"
    else
      echo $HOME/$fullfile
      rm -f $HOME/$fullfile
      ln -fs $DOTFILEDIR/$fullfile $HOME/$fullfile
    fi
  done
}

if [[ $dotfiles ]]; then
  echo "Symlinking dotfiles..."
  make_symlinks "${dotfiles[@]}"
  echo "All set!"
else
  echo "You don't have anything in '$DOTFILEDIR'"
fi

if ! [ -x "$(command -v oh-my-posh)" ]; then
  sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh && sudo chmod +x /usr/local/bin/oh-my-posh
fi