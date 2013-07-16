Requirements:
-------------

* This repository requires `Vim >= 7.3.885` along with the following features
    * `+lua`

* Recommended, but not necessary, are the following enhancements
    * A patched font for vim-airline (Lokaltog's [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) work here as well).

Installation:
-------------

    git clone https://github.com/dogonthehorizon/dotfiles-vim.git ~/.vim

### Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

### Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule update --init

### Update as needed

    cd ~/.vim
    git submodule foreach git pull origin master

