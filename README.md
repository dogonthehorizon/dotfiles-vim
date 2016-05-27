# dotfiles-vim ![Generic](https://img.shields.io/badge/status-active-green.svg)

This repo contains my personal vim and gvim configurations. They are provided
as is!

Questions and concerns can be directed [here](https://github.com/dogonthehorizon/dotfiles-vim/issues).

### Requirements

  * This repository requires `Vim >= 7.3.885` or greater along with the following features
    * `+lua`
  * Recommended, but not necessary, are the following enhancements
    * A patched font for vim-airline (Lokaltog's [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) do the trick).

### Installation

```
# Clone the repo to your ~/.vim directory
git clone https://github.com/dogonthehorizon/dotfiles-vim.git ~/.vim

# Create symlinks for your vim and gvim configs
ln -s ~/.vim/vimrc ~/.vimrc && ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch into `~/.vim` and initialize submodules
cd ~/.vim && git submodule update --init
```

### Adding new plugins

```
cd ~/.vim
# Don't forget to add the path at the end of this command to ensure
# that it ends up in the `bundle` dir.
git submodule add https://example.com/repo.vim bundle/repo

# In order to sync between all machines you will need to run this on each
# other machine from the one that added the plugin.
cd ~/.vim && git submodule update --init
```

### Updating plugins

```
cd ~/.vim
git submodule foreach git pull origin master
```

