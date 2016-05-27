#!/bin/bash

if [ -d "~/.vim" ]; then
  mv ~/.vim ~/.vim-backup
fi

if [ -f "~/.vimrc" ]; then
  mv ~/.vimrc ~/.vimrc-backup
fi

if [ -f "~/.gvimrc" ]; then
  mv ~/.gvimrc ~/.gvimrc-backup
fi

git clone https://github.com/dogonthehorizon/dotfiles-vim.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc && ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim && git submodule update --init
