#!/bin/zsh
# == 環境変数とかの設定 ==

# これが無いと、システムのzshrc読み込み時にcompinitされて、
# そのあとに追加された補完を読み込むために2回目のcompinitが必要になる
skip_global_compinit=true

# dotfilesを~/dotfilesに置く
ZDOTDIR="$HOME/dotfiles"

# nodebrew
if [[ -d "$HOME/.nodebrew" ]]; then
  path+="$HOME/.nodebrew/current/bin"
fi

# rbenv
if [[ -d "$HOME/.rbenv" ]]; then
  path+="$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
fi

# govm
if [[ -d "$HOME/.govm" ]]; then
  export GOVM_ROOT="$HOME/.govm"
  export GOROOT="$GOVM_ROOT/versions/current"
  typeset -xTU GOPATH gopath
  gopath+="$HOME/project/go"
  path+=("$GOROOT/bin" "$GOPATH/bin")
fi

# direnv
type direnv >&/dev/null && eval "$(direnv hook bash)"

