#!/bin/sh

set -e

if [ -z $DEV ]; then
  export DEV=$HOME/develop
fi

DOTFILE_DIR=$DEV/dotfiles

if [ ! -d $DOTFILE_DIR ]; then
  echo "dotfiles is not in $HOME/develop"
  exit 2
fi

if [ ! -f $DOTFILE_DIR/bin/init.sh ]; then
  echo "dotfiles init script is not exist"
  exit 2
fi

ln -sf $DOTFILE_DIR/bin/init.sh /usr/local/bin/dotfiles
ln -sf $DOTFILE_DIR/ssh/.ssh $HOME/.ssh
ln -sf $DOTFILE_DIR/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILE_DIR/vim/.vimrc $HOME/.vimrc
