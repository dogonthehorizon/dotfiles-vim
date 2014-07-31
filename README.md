dotfiles-vim ![Generic](http://img.shields.io/status/active.png?color=green)
------------

This repo is one configuration (of many) for [g|m]vim. Use them at your own risk.

Eventually this repo will become a submodule of a more general `dotfiles` repo, coming Soon(tm).

Questions and concerns can be directed [here](https://github.com/dogonthehorizon/dotfiles-vim/issues).

Requirements:
-------------

* This repository requires `Vim >= 7.3.885` or greater along with the following features
    * `+lua`

* Recommended, but not necessary, are the following enhancements
    * A patched font for vim-airline (Lokaltog's [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) work here as well).

Installation:
-------------
```bash
git clone https://github.com/dogonthehorizon/dotfiles-vim.git ~/.vim
```

### Create symlinks:
```bash
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

### Switch to the `~/.vim` directory, and fetch submodules:
```bash
cd ~/.vim
git submodule update --init
```

### Install plugins as needed
```bash
cd ~/.vim
# Don't forget to add the path at the end of this command to ensure
# that it ends up in the `bundle` dir.
git submodule add https://example.com/repo.vim bundle/repo
```

### Update as needed
```bash
cd ~/.vim
git submodule foreach git pull origin master
  ```
