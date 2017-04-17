#!/bin/sh
########## Constants ##########

# Arg 1 constants, PC
PC_MINE="my_pc"
PC_LABS="lab_pc"

# Arg 2 constants, Terminal
TERMINAL_CYGWIN="cygwin"
TERMINAL_MSYS2="msys2"
########## Functions ##########

# Common links
function dotfile_links () {
  ln -s -f "${HOME}/dotfiles/.bashrc"        "${HOME}/.bashrc"
  ln -s -f "${HOME}/dotfiles/.bash_profile"  "${HOME}/.bash_profile"
  ln -s -f "${HOME}/dotfiles/.screenrc"      "${HOME}/.screenrc"
  ln -s -f "${HOME}/dotfiles/.vim"           "${HOME}/.vim"
  ln -s -f "${HOME}/dotfiles/.vimrc"         "${HOME}/.vimrc"
  ln -s -f "${HOME}/dotfiles/.gvimrc"        "${HOME}/.vimrc"
  ln -s -f "${HOME}/dotfiles/.virc"          "${HOME}/.virc"
}

# Cygwin for my PC
function my_PC_cygwin () {
  # Common
  ln -s -f /cygdrive/c/Users/Mamoru/Downloads ~/Downloads
  ln -s -f /cygdrive/c/Users/Mamoru/Desktop   ~/Desktop
  ln -s -f /cygdrive/c/Users/Mamoru/Documents ~/Documents
  ln -s -f /cygdrive/c/Users/Mamoru/Pictures  ~/Pictures
  ln -s -f /cygdrive/c/Users/Mamoru/Videos    ~/Videos
  ln -s -f /cygdrive/c/Users/Mamoru/Music     ~/Music

  # Cache
  ln -s -f /cygdrive/c/Users/Mamoru/AppData/Local/Temp ~/Temp

  #SVN
  SVN_LOCAL_PATH=/cygdrive/c/Users/Mamoru/Documents/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}          ~/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"   ~/CDH
  ln -s -f ${SVN_LOCAL_PATH}/"地上局" ~/groundStation

  # University
  ln -s -f /cygdrive/c/Users/Mamoru/Documents/ut_lectures/Lab ~/Lab

  # project
  ln -s -f /cygdrive/c/Users/Mamoru/Documents/YUI ~/yui

  # programming
  ln -s -f /cygdrive/c/projects ~/projects

  # gimp 2.0
  ln -s -f /cygdrive/c/cygwin64/home/Mamoru/.gimp-2.8/palettes ~/gimpPalettes

  # vim include completion dir setting
  ln -s -f /cygdrive/c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include  ~/.vim/dir/directx
}

# MSYS2 for my PC
function my_PC_msys2 () {
  # Common
  ln -s -f /c/Users/Mamoru/Downloads ~/Downloads
  ln -s -f /c/Users/Mamoru/Desktop   ~/Desktop
  ln -s -f /c/Users/Mamoru/Documents ~/Documents
  ln -s -f /c/Users/Mamoru/Pictures  ~/Pictures
  ln -s -f /c/Users/Mamoru/Videos    ~/Videos
  ln -s -f /c/Users/Mamoru/Music     ~/Music

  # Cache
  ln -s -f /c/Users/Mamoru/AppData/Local/Temp ~/Temp

  #SVN
  SVN_LOCAL_PATH=/c/Users/Mamoru/Documents/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}          ~/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"   ~/CDH
  ln -s -f ${SVN_LOCAL_PATH}/"地上局" ~/groundStation

  # University
  ln -s -f /c/Users/Mamoru/Documents/ut_lectures/Lab ~/Lab

  # project
  ln -s -f /c/Users/Mamoru/Documents/YUI ~/yui

  # programming
  ln -s -f /c/projects ~/projects

  # gimp 2.0
  ln -s -f /c/cygwin64/home/Mamoru/.gimp-2.8/palettes ~/gimpPalettes

  # vim include completion dir setting
  ln -s -f /c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include  ~/.vim/dir/directx
}

# Cygwin for Lab PC
function lab_PC_cygwin () {
  # Common
  ln -s -f /cygdrive/c/Users/mkami/Downloads ~/Downloads
  ln -s -f /cygdrive/c/Users/mkami/Desktop   ~/Desktop
  ln -s -f /cygdrive/c/Users/mkami/Documents ~/Documents
  ln -s -f /cygdrive/c/Users/mkami/Pictures  ~/Pictures
  ln -s -f /cygdrive/c/Users/mkami/Videos    ~/Videos
  ln -s -f /cygdrive/c/Users/mkami/Music     ~/Music

  # Cache
  ln -s -f /cygdrive/c/Users/mkami/AppData/Local/Temp ~/Temp
}

# MSYS2 for Lab PC
function lab_PC_msys2 () {
  # Common
  ln -s -f /c/Users/mkami/Downloads ~/Downloads
  ln -s -f /c/Users/mkami/Desktop   ~/Desktop
  ln -s -f /c/Users/mkami/Documents ~/Documents
  ln -s -f /c/Users/mkami/Pictures  ~/Pictures
  ln -s -f /c/Users/mkami/Videos    ~/Videos
  ln -s -f /c/Users/mkami/Music     ~/Music

  # Cache
  ln -s -f /c/Users/mkami/AppData/Local/Temp ~/Temp
}
########## Calls ##########

# Argument check
if [ $# -ne 2 ]; then
  echo "Arg error"

  # Arg1 check
  echo "Arg 1!"
  echo "${PC_MINE}: Own PC"
  echo "${PC_LABS}: Lab PC"

  # Arg2 check
  echo "Arg 2!"
  echo "${TERMINAL_CYGWIN}: Cygwin terminal"
  echo "${TERMINAL_MSYS2}: MSYS2 terminal"

  # Error exit
  exit 1
fi

# Common link generation
dotfile_links

# Separated Link generation
if [ $1 == ${PC_MINE} ]; then

  # For My PC
  if [ $2 == ${TERMINAL_CYGWIN} ]; then
    my_PC_cygwin
  elif [ $2 == ${TERMINAL_MSYS2} ]; then
    my_PC_msys2
  else

    # Erro Exit
    echo "Arg2 error"
    exit 1
  fi
elif [ $1 == ${PC_LABS} ]; then

  # For Lab PC
  if [ $2 == ${TERMINAL_CYGWIN} ]; then
    lab_PC_cygwin
  elif [ $2 == ${TERMINAL_MSYS2} ]; then
    lab_PC_msys2
  else

    # Erro Exit
    echo "Arg2 error"
    exit 1
  fi
else

  # Erro Exit
  echo "Arg1 error"
  exit 1
fi
