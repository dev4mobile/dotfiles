#!/bin/sh

set -e

DOTFILE_DIR=$DEV/dotfiles

ln -sf $DOTFILE_DIR/ssh/.ssh $HOME/.ssh
ln -sf $DOTFILE_DIR/zsh/.zshrc $HOME/.zshrc

