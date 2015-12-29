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
ln -sFvh $DOTS/vimrc.bundles ~/.vimrc.bundles
ln -sFvh $DOTS/gvimrc ~/.gvimrc

ln -sFvh $DOTS/gitconfig ~/.gitconfig
ln -sFvh $DOTS/githelpers ~/.githelpers
ln -sFvh $DOTS/hushlogin ~/.hushlogin

ln -sFvh $DOTS/agignore ~/.agignore

ln -sFvh $DOTS/vim ~/.vim

ln -sFvh $DOTS/tmux.conf ~/.tmux.conf

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo 'installing vim-plug for vim magic'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
fi

ln -sFvh $DOTS/bin ~/bin
