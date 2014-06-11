# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
 ZSH_THEME="kolo"
#ZSH_THEME="ukitaka"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

# General Settings
export EDITOR=vim        # エディタをvimに設定
export GIT_EDITOR=vim
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定

# Colors
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

# git 
export GIT_SSL_NO_VERIFY=true
export GIT_EDITOR=/usr/bin/vim

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

source ~/perl5/perlbrew/etc/bashrc

alias ctags="`brew --prefix`/bin/ctags"
