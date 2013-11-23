#!/bin/bash

DOTS="$PWD"

ln -sFv $DOTS/bash_profile ~/.bash_profile
ln -sFv $DOTS/bash_prompt ~/.bash_prompt
ln -sFv $DOTS/bashrc ~/.bashrc
ln -sFv $DOTS/aliases ~/.aliases
ln -sFv $DOTS/exports ~/.exports
ln -sFv $DOTS/functions ~/.functions
ln -sFv $DOTS/profile ~/.profile

ln -sFv $DOTS/vimrc ~/.vimrc
ln -sFv $DOTS/gvimrc ~/.gvimrc

ln -sFv $DOTS/gitconfig ~/.gitconfig
ln -sFv $DOTS/githelpers ~/.githelpers
ln -sFv $DOTS/hushlogin ~/.hushlogin

ln -sFv $DOTS/vim ~/.vim
#ln -sFv $DOTS/bin ~/bin

#BIN_FILES=$DOTS/bin/.*
#for binfile in $BIN_FILES; do
#    ln -sFv $DOTS/$binfile ~/bin/$binfile
#done
