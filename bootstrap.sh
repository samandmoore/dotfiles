#!/bin/bash

DOTS="$PWD"

ln -sFvh $DOTS/bash_profile ~/.bash_profile
ln -sFvh $DOTS/bash_prompt ~/.bash_prompt
ln -sFvh $DOTS/bashrc ~/.bashrc
ln -sFvh $DOTS/aliases ~/.aliases
ln -sFvh $DOTS/exports ~/.exports
ln -sFvh $DOTS/functions ~/.functions
ln -sFvh $DOTS/screenrc ~/.screenrc

ln -sFvh $DOTS/vimrc ~/.vimrc
ln -sFvh $DOTS/gvimrc ~/.gvimrc

ln -sFvh $DOTS/gitconfig ~/.gitconfig
ln -sFvh $DOTS/githelpers ~/.githelpers
ln -sFvh $DOTS/hushlogin ~/.hushlogin

ln -sFvh $DOTS/agignore ~/.agignore

ln -sFvh $DOTS/vim ~/.vim

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo 'installing vundle for vim magic'
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

