#opt
setopt auto_menu
setopt correct
setopt auto_name_dirs
setopt auto_remove_slash
setopt extended_history
setopt hist_ignore_dups
setopt pushd_ignore_dups
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob
setopt hist_ignore_all_dups
setopt no_beep
setopt sh_word_split
setopt auto_param_keys
setopt auto_pushd
setopt list_packed
setopt list_types
setopt no_case_glob
setopt complete_in_word
setopt prompt_subst
PROMPT='%B%F{yellow}(%m) %B%F{magenta}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}%% '

if [[ -f $HOME/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh

  # plugins
  zplug "chrissicool/zsh-256color", use:"zsh-256color.plugin.zsh"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "plugins/brew",    from:oh-my-zsh, if:"which brew"
  zplug "plugins/tmux",    from:oh-my-zsh, if:"which tmux"

  zplug load
fi

# load
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U add-zsh-hook

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
alias g="git"
alias gti="git"
alias gst="git status"
alias gdf="git diff"
alias glg="git log-all"

# theme
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

add-zsh-hook precmd  theme_precmd

# zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.mac ] && source ~/.zshrc.mac

