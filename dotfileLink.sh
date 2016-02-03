#!/bin/sh

ln -s -f "${HOME}/dotfiles/.bashrc"        "${HOME}/.bashrc"
ln -s -f "${HOME}/dotfiles/.bash_profile"  "${HOME}/.bash_profile"
ln -s -f "${HOME}/dotfiles/.screenrc"      "${HOME}/.screenrc"
ln -s -f "${HOME}/dotfiles/.vim"           "${HOME}/.vim"
ln -s -f "${HOME}/dotfiles/.vimrc"         "${HOME}/.vimrc"
ln -s -f "${HOME}/dotfiles/.vimrc_HEAVY"   "${HOME}/.vimrc_HEAVY"
ln -s -f "${HOME}/dotfiles/.vimrc_LIGHT"   "${HOME}/.vimrc_LIGHT"
ln -s -f "${HOME}/dotfiles/.virc"          "${HOME}/.virc"

#code under this has no effect to mintty.
#copy .minttyrc directory in your home directory.
#ln -s -f ${HOME}/dotfiles/.minttyrc         ${HOME}/.minttyrc
