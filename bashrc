# 環境設定の読み込み

DOTFILES="$HOME/dotfiles"
source "$DOTFILES/bashenv"

# == 動作に関する設定 ==

# ls系
alias ls='ls --color'
alias lsa='ls -a'

# mkdir + cd = take
take() {
  mkdir $1 && my_cd $1
}

# cdコマンドのオーバーライド
my_cd() {
  pushd "${1:-$HOME}" >/dev/null && ls
}
my_..() {
  popd "$@" >/dev/null && ls
}
alias cd='my_cd'
alias ..='my_..'
# 移動するディレクトリをいい感じに訂正してくれる
shopt -s cdspell

# 色関係の関数
rgb() {
  local red=$(( $1 * 6 / 256 ))
  local green=$(( $2 * 6 / 256 ))
  local blue=$(( $3 * 6 / 256 ))
  echo $(( red * 36 + green * 6 + blue + 16 ))
}
color() {
  echo "\["$'\e'"[38;5;${1}m\]"
}
background() {
  echo "\["$'\e'"[48;5;${1}m\]"
}
default_color="\["$'\e'"[0m\]"

# プロンプトの設定
BGCOLOR=$([[ -x /.dockerinit ]] && echo "36" || echo "26")
PS1=$'\n'
PS1="$PS1\[\e[48;5;\$((\$? == 0 ? $BGCOLOR : 161))m\]$(color 15) \u@\h $(background 238) \w $(background 240) \$(date +\"%Y/%m/%d %H:%M:%S\") ${default_color}"
PS1="$PS1\n$(color 15)$(background 236) % ${default_color} "
PS2="$(color 15)$(background 236) > ${default_color} "

# 拡張グロブを有効にする
shopt -s extglob
