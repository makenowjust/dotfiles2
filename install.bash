#!/bin/bash

set -e

install-home() {
  rm -f "$HOME/.$1"
  ln -s "$PWD/$1" "$HOME/.$1"
  echo "$PWD/$1 --> $HOME/.$1"
}

install-home bashrc
mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim_backup"
install-home vimrc
install-home gitconfig

if [[ -n "$DISPLAY" ]]; then
  install-home xprofile
  install-home uim
fi
