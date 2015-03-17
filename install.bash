#!/bin/bash

set -e

install-home() {
  rm -f "$HOME/.$1"
  ln -s "$PWD/$1" "$HOME/.$1"
  echo "$PWD/$1 --> $HOME/.$1"
}

install-home xprofile
install-home bashrc
install-home vimrc
install-home uim
