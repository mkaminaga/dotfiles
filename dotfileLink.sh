#!/bin/sh

ln -sf "${HOME}/dotfiles/.git"           "${HOME}/.git"
ln -sf "${HOME}/dotfiles/.gitattributes" "${HOME}/.gitattributes"
ln -sf "${HOME}/dotfiles/.gitignore"     "${HOME}/.gitignore"
ln -sf "${HOME}/dotfiles/.bashrc"        "${HOME}/.bashrc"
ln -sf "${HOME}/dotfiles/.bash_profile"  "${HOME}/.bash_profile"
ln -sf "${HOME}/dotfiles/.screenrc"      "${HOME}/.screenrc"
ln -sf "${HOME}/dotfiles/.vim"           "${HOME}/.vim"
ln -sf "${HOME}/dotfiles/.vimrc"         "${HOME}/.vimrc"
ln -sf "${HOME}/dotfiles/.virc"          "${HOME}/.virc"

#code under this has no effect to mintty.
#copy .minttyrc directory in your home directory.
#ln -sf ${HOME}/dotfiles/.minttyrc         ${HOME}/.minttyrc
