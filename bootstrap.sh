#!/bin/bash

DOTS="$PWD"

ln -sFvh $DOTS/bash_profile ~/.bash_profile
ln -sFvh $DOTS/bash_prompt ~/.bash_prompt
ln -sFvh $DOTS/bashrc ~/.bashrc
ln -sFvh $DOTS/aliases ~/.aliases
ln -sFvh $DOTS/exports ~/.exports
ln -sFvh $DOTS/functions ~/.functions
ln -sFvh $DOTS/profile ~/.profile
ln -sFvh $DOTS/screenrc ~/.screenrc

ln -sFvh $DOTS/vimrc ~/.vimrc
ln -sFvh $DOTS/gvimrc ~/.gvimrc

ln -sFvh $DOTS/gitconfig ~/.gitconfig
ln -sFvh $DOTS/githelpers ~/.githelpers
ln -sFvh $DOTS/hushlogin ~/.hushlogin

ln -sFvh $DOTS/vim ~/.vim
#ln -sFvh $DOTS/bin ~/bin

#BIN_FILES=$DOTS/bin/.*
#for binfile in $BIN_FILES; do
#    ln -sFvh $DOTS/$binfile ~/bin/$binfile
#done
