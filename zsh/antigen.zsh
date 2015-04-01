#!/bin/zsh

# antigenの設定
if [[ -f $ZDOTDIR/antigen/antigen.zsh ]]; then
  # 読み込み
  source $ZDOTDIR/antigen/antigen.zsh

  # シンタックスハイライト
  antigen bundle zsh-users/zsh-syntax-highlighting

  # pecoを便利にする
  if [[ -x =peco ]]; then
    antigen bundle mollifier/anyframe
    # Ctrl-hでヒストリを検索
    bindkey '^h' anyframe-widget-execute-history
    # Ctrl-x gでghqのディレクトリ移動
    bindkey '^g' anyframe-widget-cd-ghq-repository
  fi
fi
