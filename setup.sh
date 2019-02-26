#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  DOT_FILES=( .zshrc .zshrc.mac .vimrc .vim .gvimrc .xvimrc .tmux.conf .ideavimrc .gitconfig .gitignore)
else
  DOT_FILES=( .zshrc .vimrc .vim .tmux.conf .gitconfig .gitignore)
fi

for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/$file ]; then
    ln -s $HOME/dotfiles/$file $HOME/$file
  fi
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
[ ! -d ~/.zplug ] && curl -sL zplug.sh/installer | zsh && chmod 744 $HOME/.zplug/init.zsh

# for mac
[ ! "$(uname)" == 'Darwin' ] && exit 0

# Homebrew
if ! type brew >/dev/null 2>&1; then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# homebrew-bundle
brew tap Homebrew/bundle
brew bundle

