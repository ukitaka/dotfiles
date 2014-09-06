# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="kolo"
plugins=(brew git github history)
source $ZSH/oh-my-zsh.sh

# load
autoload -U compinit
compinit
autoload -U colors
colors


# General Settings
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定

# Colors
export TERM=xterm-256color
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# Alias
alias ls="ls -GF"
alias gls="gls --color"

# git 
eval "$(hub alias -s)"
alias g="git"
alias gst="git status"
alias gdf="git diff"
alias glg="git log-all"

# path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
