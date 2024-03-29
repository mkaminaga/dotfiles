#!/bin/bash

#
# Unix:
#   ln -f -s <Original> <Link>
#
# Windows:
#   mklink /H <Link> <Original>
#

# OS judgement
export MACHINE=''
uname_output="$(uname -s)"
case "${uname_output}" in
  Darwin*)
    # Mac OS
    ln -f -s ~/dotfiles/.bashrc ~/.zshrc
    ;;
  *)
    ;;
esac
echo "MACHINE=${MACHINE}"

# Shell
ln -f -s ~/dotfiles/.bashrc ~/.bashrc
ln -f -s ~/dotfiles/.bashrc.utils ~/.bashrc.utils
ln -f -s ~/dotfiles/.bashrc.alias ~/.bashrc.alias

# Profile
ln -f -s ~/dotfiles/.bash_profile ~/.bash_profile

# Commands
ln -f -s ~/dotfiles/.ctags ~/.ctags
ln -f -s ~/dotfiles/.minttyrc ~/.minttyrc
ln -f -s ~/dotfiles/.screenrc ~/.screenrc
ln -f -s ~/dotfiles/.Xmodmap ~/.Xmodmap
ln -f -s ~/dotfiles/.xinitrc ~/.xinitrc
ln -f -s ~/dotfiles/.imwheelrc ~/.imwheelrc

# Vim (Symbolic links for UNIX)
ln -f -s ~/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/dotfiles/.vimrc.keymap ~/.vimrc.keymap
ln -f -s ~/dotfiles/.vimrc.util ~/.vimrc.util
ln -f -s ~/dotfiles/.vimrc.plugins ~/.vimrc.plugins

