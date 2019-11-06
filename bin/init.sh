#!/bin/bash

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


#ln -sf $DOTFILE_DIR/bin/init.sh /usr/local/bin/dotfiles
#ln -sf $DOTFILE_DIR/ssh/.ssh $HOME/.ssh
#ln -sf $DOTFILE_DIR/zsh/.zshrc $HOME/.zshrc
#ln -sf $DOTFILE_DIR/vim/.vimrc $HOME/.vimrc

for file in `ls $DOTFILE_DIR`; do
  if [[ $file = "iTerm2" || $file = "README.md" ]]; then
   continue
  else 
    su_dir_parent=$DOTFILE_DIR/$file
    for sub_dir in $(ls -A $su_dir_parent | egrep '^\.'); do
      if [[ $sub_dir = ".gitignore" ]]; then
        continue 
      else 
        `ln -sf $su_dir_parent/$sub_dir $HOME/$sub_dir`
      fi   
    done
  fi
done
