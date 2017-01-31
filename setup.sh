#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    DOT_FILES=( .zshrc .zshrc.mac .vimrc .vim .gvimrc .xvimrc .tmux.conf .ideavimrc .gitconfig .gitignore)
else
    DOT_FILES=( .zshrc .vimrc .vim .gvimrc .xvimrc .tmux.conf .ideavimrc .gitconfig .gitignore)
fi

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ]; then
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

[ ! -d ~/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'

