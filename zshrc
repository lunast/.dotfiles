# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定

bindkey -e               # キーバインドをemacsモードに設定

setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う

### Complement ###
autoload -U compinit; compinit                      # 補完機能を有効にする
setopt auto_list                                    # 補完候補を一覧で表示する(d)
setopt auto_menu                                    # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed                                  # 補完候補をできるだけ詰めて表示する
setopt list_types                                   # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete                # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ------------------------------
# Look And Feel Settings
# ------------------------------
# 補完時の色の設定
export LS_COLORS='di=38;5;33:ln=38;5;207:so=01;32:ex=38;5;82:bd=43;34:cd=38;5;208:su=41;30:sg=46;30:tw=48;5;27;38;5;0:ow=38;5;226'
# 補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
PROMPT="%F{051}%n@%m:%~$%f "
RPROMPT=
PROMPT2="%F{051}> %f"
SPROMPT="%F{208}%r is correct? [Yes, No, Abort, Edit] %f"

# root時のプロンプト
[ $UID -eq 0 ] &&
  PROMPT="%F{202}%n@%m:%~#%f "
;

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

alias history='history -E'
alias vigenere='python2 ~/.dotfiles/python/vigenere.py'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status branch_color

  # gitで管理されていないディレクトリは何も返さない
  git status > /dev/null 2>&1 || return

  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_color="%F{010}"
    branch_status=""
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_color="%F{009}"
    branch_status="?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_color="%F{009}"
    branch_status="+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_color="%F{011}"
    branch_status="!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{009}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{033}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_color}${branch_status}[${branch_name}]"
}

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# 256色確認
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d*■\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
        done
    echo
}
