#!/bin/zsh
# == 環境変数とかの設定 ==

# DOTFILESはZDOTDIRと同じ
export DOTFILES=$ZDOTDIR

# これが無いと、システムのzshrc読み込み時にcompinitされて、
# そのあとに追加された補完を読み込むために2回目のcompinitが必要になる
skip_global_compinit=true

# これが無いとlightline.vimで残念になる
export TERM=xterm-256color

# ホームディレクトリ直下のbinをパスに追加
path+=$HOME/bin

# ダイナミックリンクするライブラリのパスを設定
typeset -xTU LD_LIBRARY_PATH ld_library_path
ld_library_path+=/usr/local/lib
typeset -xTU LD_RUN_PATH ld_run_path
ld_run_path+=/usr/local/lib

# nodebrew
if [[ -d $HOME/.nodebrew ]]; then
  path+=$HOME/.nodebrew/current/bin
fi

# rbenv
if [[ -d $HOME/.rbenv ]]; then
  path+=$HOME/.rbenv/bin
  eval "$(rbenv init -)"
fi

# govm
if [[ -d $HOME/.govm ]]; then
  export GOVM_ROOT=$HOME/.govm
  export GOROOT=$GOVM_ROOT/versions/current
  typeset -xTU GOPATH gopath
  gopath+=$HOME/project/go
  path+=($GOROOT/bin $GOPATH/bin)
fi

# phpbrew
if [[ -d $HOME/.phpbrew ]]; then
  source $HOME/.phpbrew/bashrc
fi

# direnv
type direnv >&/dev/null && eval "$(direnv hook bash)"

