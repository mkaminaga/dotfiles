# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

export PATH="${PATH}:/cygdrive/c/WinLinks"
