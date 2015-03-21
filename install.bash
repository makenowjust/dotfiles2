#!/bin/bash

set -e

install-home() {
  rm -f "$HOME/.$1"                  && \
  ln -s "$PWD/$1" "$HOME/.$1"        && \
  echo "$PWD/$1 --> $HOME/.$1"
}

install-dotdir() {
  rm -f "$PWD/.$1"                   && \
  ln -s "$PWD/$1" "$PWD/.$1"         && \
  echo "$PWD/$1 --> $PWD/.$1"
}

make-directory() {
  mkdir -p "$HOME/$1"                && \
  echo "MAKE DIRECTORY --> $HOME/$1"
}

install-home zshenv
install-dotdir zshrc
make-directory .vim
make-directory .vim_backup
install-home vimrc
install-home gitconfig

if [[ -n "$DISPLAY" ]]; then
  install-home xprofile
  install-home uim
fi
