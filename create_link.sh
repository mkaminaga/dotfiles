#!/bin/sh
########## Constants ##########

# Arg 2 constants, PC
PC_MINE="my_pc"
PC_LABS="lab_pc"

# Arg 3 constants, Terminal
TERMINAL_CYGWIN="cygwin"
TERMINAL_MSYS2="msys2"
########## Functions ##########

# Common dotfiles
function dotfile_links () {
  # Dotfiles (Common)
  ln -s -f ${1}/dotfiles/.ctags         ${1}/.ctags
  ln -s -f ${1}/dotfiles/.git           ${1}/.git
  ln -s -f ${1}/dotfiles/.gitattributes ${1}/.gitattributes
  ln -s -f ${1}/dotfiles/.gitignore     ${1}/.gitignore
  ln -s -f ${1}/dotfiles/.gvimrc        ${1}/.gvimrc
  ln -s -f ${1}/dotfiles/.minttyrc      ${1}/.minttyrc
  ln -s -f ${1}/dotfiles/.my_vim        ${1}/.my_vim
  ln -s -f ${1}/dotfiles/.vimrc         ${1}/.vimrc
}

# Cygwin for my PC
function my_PC_cygwin () {
  # Dotfiles (Local)
  ln -s -f ${1}/dotfiles/.bashrc_cygwin       ${1}/.bashrc
  ln -s -f ${1}/dotfiles/.bash_profile_cygwin ${1}/.bash_profile

  # Windows shortcuts
  ln -s -f /cygdrive/c/Users/Mamoru/Downloads ${1}/Downloads
  ln -s -f /cygdrive/c/Users/Mamoru/Desktop   ${1}/Desktop
  ln -s -f /cygdrive/c/Users/Mamoru/Documents ${1}/Documents
  ln -s -f /cygdrive/c/Users/Mamoru/Pictures  ${1}/Pictures
  ln -s -f /cygdrive/c/Users/Mamoru/Videos    ${1}/Videos
  ln -s -f /cygdrive/c/Users/Mamoru/Music     ${1}/Music

  # Cache
  ln -s -f /cygdrive/c/Users/Mamoru/AppData/Local/Temp ${1}/Temp

  #SVN
  SVN_LOCAL_PATH=/cygdrive/c/Users/Mamoru/Documents/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}          ${1}/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"   ${1}/CDH
  ln -s -f ${SVN_LOCAL_PATH}/"地上局" ${1}/groundStation

  # University
  ln -s -f /cygdrive/c/Users/Mamoru/Documents/ut_lectures/Lab ${1}/Lab

  # project
  ln -s -f /cygdrive/c/Users/Mamoru/Documents/YUI ${1}/yui

  # programming
  ln -s -f /cygdrive/c/projects ${1}/projects

  # gimp 2.0
  ln -s -f /cygdrive/c/cygwin64/home/Mamoru/.gimp-2.8/palettes ${1}/gimpPalettes

  # vim include completion dir setting
  ln -s -f /cygdrive/c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include ${1}/.vim/dir/directx
}

# MSYS2 for my PC
function my_PC_msys2 () {
  # Dotfiles (Local)
  ln -s -f ${1}/dotfiles/.bashrc_msys2       ${1}/.bashrc
  ln -s -f ${1}/dotfiles/.bash_profile_msys2 ${1}/.bash_profile

  # Windows shortcuts
  ln -s -f /c/Users/Mamoru/Downloads ${1}/Downloads
  ln -s -f /c/Users/Mamoru/Desktop   ${1}/Desktop
  ln -s -f /c/Users/Mamoru/Documents ${1}/Documents
  ln -s -f /c/Users/Mamoru/Pictures  ${1}/Pictures
  ln -s -f /c/Users/Mamoru/Videos    ${1}/Videos
  ln -s -f /c/Users/Mamoru/Music     ${1}/Music

  # Cache
  ln -s -f /c/Users/Mamoru/AppData/Local/Temp ${1}/Temp

  #SVN
  SVN_LOCAL_PATH=/c/Users/Mamoru/Documents/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}          ${1}/ITF-2
  ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"   ${1}/CDH
  ln -s -f ${SVN_LOCAL_PATH}/"地上局" ${1}/groundStation

  # University
  ln -s -f /c/Users/Mamoru/Documents/ut_lectures/Lab ${1}/Lab

  # project
  ln -s -f /c/Users/Mamoru/Documents/YUI ${1}/yui

  # programming
  ln -s -f /c/projects ${1}/projects

  # gimp 2.0
  ln -s -f /c/cygwin64/home/Mamoru/.gimp-2.8/palettes ${1}/gimpPalettes

  # vim include completion dir setting
  ln -s -f /c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include  ${1}/.vim/dir/directx
}

# Cygwin for Lab PC
function lab_PC_cygwin () {
  # Dotfiles (Local)
  ln -s -f ${1}/dotfiles/.bashrc_cygwin       ${1}/.bashrc
  ln -s -f ${1}/dotfiles/.bash_profile_cygwin ${1}/.bash_profile

  # Windows shortcuts
  ln -s -f /cygdrive/c/Users/mkami/Downloads ${1}/Downloads
  ln -s -f /cygdrive/c/Users/mkami/Desktop   ${1}/Desktop
  ln -s -f /cygdrive/c/Users/mkami/Documents ${1}/Documents
  ln -s -f /cygdrive/c/Users/mkami/Pictures  ${1}/Pictures
  ln -s -f /cygdrive/c/Users/mkami/Videos    ${1}/Videos
  ln -s -f /cygdrive/c/Users/mkami/Music     ${1}/Music

  # Cache
  ln -s -f /cygdrive/c/Users/mkami/AppData/Local/Temp ${1}/Temp
}

# MSYS2 for Lab PC
function lab_PC_msys2 () {
  # Dotfiles (Local)
  ln -s -f ${1}/dotfiles/.bashrc_msys2       ${1}/.bashrc
  ln -s -f ${1}/dotfiles/.bash_profile_msys2 ${1}/.bash_profile

  # Common
  ln -s -f /c/Users/mkami/Downloads ${1}/Downloads
  ln -s -f /c/Users/mkami/Desktop   ${1}/Desktop
  ln -s -f /c/Users/mkami/Documents ${1}/Documents
  ln -s -f /c/Users/mkami/Pictures  ${1}/Pictures
  ln -s -f /c/Users/mkami/Videos    ${1}/Videos
  ln -s -f /c/Users/mkami/Music     ${1}/Music

  # Cache
  ln -s -f /c/Users/mkami/AppData/Local/Temp ${1}/Temp
}
########## Calls ##########

# Argument check
if [ $# -ne 3 ]; then
  echo "Arg error"
  # Arg 1 check
  echo "Arg 1!"
  echo "HOME"

  # Arg 2 check
  echo "Arg 2!"
  echo "${PC_MINE}: Own PC"
  echo "${PC_LABS}: Lab PC"

  # Arg 3 check
  echo "Arg 3!"
  echo "${TERMINAL_CYGWIN}: Cygwin terminal"
  echo "${TERMINAL_MSYS2}: MSYS2 terminal"

  # Error exit
  exit 1
fi

# Home directory set
HOME=$1

# Common link generation
dotfile_links ${HOME}

# Separated Link generation
if [ $2 == ${PC_MINE} ]; then

  # For My PC
  if [ $3 == ${TERMINAL_CYGWIN} ]; then
    my_PC_cygwin ${HOME}
  elif [ $3 == ${TERMINAL_MSYS2} ]; then
    my_PC_msys2 ${HOME}
  else

    # Erro Exit
    echo "Arg3 error"
    exit 1
  fi
elif [ $2 == ${PC_LABS} ]; then

  # For Lab PC
  if [ $3 == ${TERMINAL_CYGWIN} ]; then
    lab_PC_cygwin ${HOME}
  elif [ $3 == ${TERMINAL_MSYS2} ]; then
    lab_PC_msys2 ${HOME}
  else

    # Erro Exit
    echo "Arg3 error"
    exit 1
  fi
else

  # Erro Exit
  echo "Arg2 error"
  exit 1
fi

# End of the script
exit 1
