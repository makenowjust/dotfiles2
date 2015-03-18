" Vi互換にしない
set nocompatible

" 表示関連
" 行番号は5桁目まで表示
set number
set numberwidth=5
" タブの幅は2
set tabstop=2
" マルチバイト文字でずれにくくする
set ambiwidth=double
" コマンド行を2行に
set cmdheight=2
" ステータス行も
set laststatus=2
" カーソルのある行に下線を引く
set cursorline
" タブバーを常に表示
set showtabline=2
" 括弧の強調
set showmatch

" インデント関連
set cindent
set smarttab
" インデントは2
set shiftwidth=2
set softtabstop=0
" タブはスペースに置き換える
set expandtab

" 検索関連
" インクリメンタルサーチ
set incsearch
" ハイライト
set hlsearch

" エンコーディング関連
set encoding=utf-8
set charconvert=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis

" 動作関連
set backspace=indent,eol,start
" バックスペースとスペースでのみ行を越えて移動できる
set whichwrap=b,s

" 保存関連
" バックアップ
set backup
set backupdir=$HOME/\.vim_backup
set writebackup
" スワップファイルは作成しない
set noswapfile
" カーソルの位置などを保存
set viewoptions=cursor,folds
augroup SaveView
  autocmd!
  autocmd BufWinLeave ?* silent mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

" シンタックスハイライトを有効に
syntax on
