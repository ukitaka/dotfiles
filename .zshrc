ZSH=$HOME/.oh-my-zsh
 ZSH_THEME="kolo"
#ZSH_THEME="ukitaka"
plugins=(git)

source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# git 
export GIT_SSL_NO_VERIFY=true
export GIT_EDITOR=/usr/bin/vim
