#!/bin/sh

########## Description ##########
# Script to create link
# Usage:
# ./create_link.sh <Home> <pc_flag> <terminal_flag>
#
# Example:
# 1) Cygwin on My PC
# ./create_link.sh C:\\cygwin64\\home\\Mamoru my_pc cygwin
#
# 2) Msys on My PC
# ./create_link.sh C:\\msys64\\home\\Mamoru my_pc msys2
#
# 3) Cygwin on Laboratry
# ./create_link.sh C:\\cygwin64\\home\\mkami lab_pc cygwin
#
# 4) Msys on Laboratry
# ./create_link.sh C:\\msys64\\home\\mkami lab_pc msys2

########## Constants ##########
# pc_flag, PC
CONST_MYPC="my_pc"
CONST_LABPC="lab_pc"

# terminal_flag, Terminal
CONST_CYGWIN="cygwin"
CONST_MSYS2="msys2"

# Prevent Grabled
# See also: http://qiita.com/javacommons/items/15fe76491eced93ec58b
function () {
  $* |& iconv -f cp932 -t utf-8
}

########## Functions ##########
#### Common ####
function common_links_for_all_pc () {
  # Dotfiles (Common)
  \cmd /c "mklink /H ${1}\\.ctags         ${1}\\dotfiles\\.ctags"
  \cmd /c "mklink /H ${1}\\.git           ${1}\\dotfiles\\.git"
  \cmd /c "mklink /H ${1}\\.gitattributes ${1}\\dotfiles\\.gitattributes"
  \cmd /c "mklink /H ${1}\\.gitignore     ${1}\\dotfiles\\.gitignore"
  \cmd /c "mklink /H ${1}\\.gvimrc        ${1}\\dotfiles\\.gvimrc"
  \cmd /c "mklink /H ${1}\\.minttyrc      ${1}\\dotfiles\\.minttyrc"
  \cmd /c "mklink /H ${1}\\.my_vim        ${1}\\dotfiles\\.my_vim"
  \cmd /c "mklink /H ${1}\\.vimrc         ${1}\\dotfiles\\.vimrc"
}

#### My PC ####
## Common links
function common_links_for_mypc () {
  # Windows shortcuts
  \cmd /c "mklink /J ${1}\\Downloads C:\\cygdrive\\c\\Users\\Mamoru\\Downloads"
  \cmd /c "mklink /J ${1}\\Desktop   C:\\cygdrive\\c\\Users\\Mamoru\\Desktop"
  \cmd /c "mklink /J ${1}\\Documents C:\\cygdrive\\c\\Users\\Mamoru\\Documents"
  \cmd /c "mklink /J ${1}\\Pictures  C:\\cygdrive\\c\\Users\\Mamoru\\Pictures"
  \cmd /c "mklink /J ${1}\\Videos    C:\\cygdrive\\c\\Users\\Mamoru\\Videos"
  \cmd /c "mklink /J ${1}\\Music     C:\\cygdrive\\c\\Users\\Mamoru\\Music"
  \cmd /c "mklink /J ${1}\\Temp      C:\\cygdrive\\c\\Users\\Mamoru\\AppData\\Local\\Temp"

  # programming
  \cmd /c "mklink /J ${1}\\projects C:\\cygdrive\\c\\projects"

  #SVN
  SVN_PATH=C:\\cygdrive\\c\\Users\\Mamoru\\Documents\\ITF-2
  \cmd /c "mklink /J ${1}\\ITF-2         ${SVN_PATH}"
  \cmd /c "mklink /J ${1}\\CDH           ${SVN_PATH}/\"C&Dh\""
  \cmd /c "mklink /J ${1}\\groundStation ${SVN_PATH}/地上局"

  # University
  \cmd /c "mklink /J ${1}\\Lab C:\\cygdrive\\c\\Users\\Mamoru\\Documents\\ut_lectures\\Lab"

  # project
  \cmd /c "mklink /J ${1}\\yui C:\\cygdrive\\c\\Users\\Mamoru\\Documents\\YUI"
}

# Cygwin links
function cygwin_links_for_mypc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc       ${1}\\dotfiles\\.bashrc_cygwin"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_cygwin"
}

# MSYS2 links
function msys_links_for_mypc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc       ${1}\\dotfiles\\.bashrc_msys2"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_msys2"
}

#### Lab PC ####
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

# Argument length check
if [ $# -ne 3 ]; then
  echo "Format error"
  echo "Usage:"
  echo "./create_link.sh <Home> <pc_flag> <terminal_flag>"
  exit 1
fi

# Argument 2 check
if [ $2 != ${CONST_MYPC} -a $2 != ${CONST_LABPC} ]; then
  echo "Argument 2 error"
  echo "${CONST_MYPC}"
  echo "${CONST_LABPC}"
  exit 1
fi

# Argument 3 check
if [ $3 != ${CONST_CYGWIN} -a $3 != ${CONST_MSYS2} ]; then
  echo "Argument 3 error"
  echo "${CONST_CYGWIN}"
  echo "${CONST_MSYS2}"
  exit 1
fi

# Home directory set
CONST_HOME=$1

# Common link generation
common_links_for_all_pc ${CONST_HOME}

# Separated Link generation
if [ $2 == ${CONST_MYPC} ]; then
  # For My PC
  common_links_for_mypc ${CONST_HOME}

  if [ $3 == ${CONST_CYGWIN} ]; then
    cygwin_links_for_mypc ${CONST_HOME}

  elif [ $3 == ${CONST_MSYS2} ]; then
    msys_links_for_mypc ${CONST_HOME}

  fi
elif [ $2 == ${CONST_LABPC} ]; then
  # For Lab PC

  if [ $3 == ${CONST_CYGWIN} ]; then
    lab_PC_cygwin ${CONST_HOME}

  elif [ $3 == ${CONST_MSYS2} ]; then
    lab_PC_msys2 ${CONST_HOME}

  fi
fi
