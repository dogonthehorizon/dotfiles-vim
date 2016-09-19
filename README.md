# dotfiles-vim ![Generic](https://img.shields.io/badge/status-active-green.svg)

This repo contains my personal vim and gvim configurations. They are provided
as is!

If you have any questions or issues please file a ticket [here][repo-issues].

### Requirements

  * `Vim >= 7.3.885` or greater along with the following features:
    * `+lua`
  * The vim-instant-markdown node plugin installed
    * `npm install -g instant-markdown-d`
  * ghc-mod and hlint for Haskell development
    * `stack install hlint ghcmod`
  * Recommended, but not necessary, are the following enhancements
    * A patched font for vim-airline (Lokaltog's [powerline-fonts][fonts]
    do the trick).

### Installation

#### Quick Start

If you're impatient, and you trust me, you can run this setup script. Note that
this will move whatever you already have in `.vim` into `.vim-backup`.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dogonthehorizon/dotfiles-vim/master/init.sh)"
```

#### Manual Installation

If you'd like to take things at your own pace, the following commands be run
individually to get you all set up.

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

[repo-issues]: https://github.com/dogonthehorizon/dotfiles-vim/issues
[fonts]: https://github.com/Lokaltog/powerline-fonts
