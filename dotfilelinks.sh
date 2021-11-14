#!/bin/bash

#
# Unix:
#   ln -f -s <Original> <Link>
#
# Windows:
#   mklink /H <Link> <Original>
#

ln -f -s ~/dotfiles/.bash_profile_cygwin ~/.bash_profile_cygwin
ln -f -s ~/dotfiles/.bash_profile_msys2 ~/.bash_profile_msys2
ln -f -s ~/dotfiles/.bashrc ~/.bashrc
ln -f -s ~/dotfiles/.ctags ~/.ctags
ln -f -s ~/dotfiles/.gvimrc ~/.gvimrc
ln -f -s ~/dotfiles/.minttyrc ~/.minttyrc
ln -f -s ~/dotfiles/.screenrc ~/.screenrc
ln -f -s ~/dotfiles/.Xmodmap ~/.Xmodmap
ln -f -s ~/dotfiles/.xinitrc ~/.xinitrc
ln -f -s ~/dotfiles/.imwheelrc ~/.imwheelrc

# Vim (Symbolic links for UNIX)
ln -f -s ~/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/dotfiles/.vimrc.keymap ~/.vimrc.keymap

