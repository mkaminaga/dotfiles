#!/bin/sh

########## Description ##########
# Script to create link
# Usage:
# ./create_link.sh <Home> <pc_flag> <terminal_flag>
# Execute with authorized account!
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

########## Functions ##########
#### Common ####
function common_links_for_all_pc () {
  # Dotfiles (Common)
  \cmd /c "mklink /H ${1}\\.ctags	  ${1}\\dotfiles\\.ctags"
  \cmd /c "mklink /H ${1}\\.gvimrc	  ${1}\\dotfiles\\.gvimrc"
  \cmd /c "mklink /H ${1}\\.minttyrc	  ${1}\\dotfiles\\.minttyrc"
  \cmd /c "mklink /H ${1}\\.vimrc	  ${1}\\dotfiles\\.vimrc"
  \cmd /c "mklink /D ${1}\\.my_vim	  ${1}\\dotfiles\\.my_vim"
}

#### My PC ####
## Common links
function common_links_for_mypc () {
  # Windows shortcuts
  \cmd /c "mklink /D ${1}\\Downloads C:\\Users\\Mamoru\\Downloads"
  \cmd /c "mklink /D ${1}\\Desktop   C:\\Users\\Mamoru\\Desktop"
  \cmd /c "mklink /D ${1}\\Documents C:\\Users\\Mamoru\\Documents"
  \cmd /c "mklink /D ${1}\\Pictures  C:\\Users\\Mamoru\\Pictures"
  \cmd /c "mklink /D ${1}\\Videos    C:\\Users\\Mamoru\\Videos"
  \cmd /c "mklink /D ${1}\\Music     C:\\Users\\Mamoru\\Music"
  \cmd /c "mklink /D ${1}\\Temp      C:\\Users\\Mamoru\\AppData\\Local\\Temp"

  # programming
  \cmd /c "mklink /D ${1}\\projects C:\\projects"

  #SVN
  SVN_PATH=C:\\Users\\Mamoru\\Documents\\ITF-2
  \cmd /c "mklink /D ${1}\\ITF-2	 ${SVN_PATH}"
  \cmd /c "mklink /D ${1}\\CDH		 ${SVN_PATH}\\\"C&Dh\""
  \cmd /c "mklink /D ${1}\\groundStation ${SVN_PATH}\\地上局"

  # University
  \cmd /c "mklink /D ${1}\\Lab C:\\Users\\Mamoru\\Documents\\ut_lectures\\Lab"

  # project
  \cmd /c "mklink /D ${1}\\yui C:\\Users\\Mamoru\\Documents\\YUI"
}

# Cygwin links
function cygwin_links_for_mypc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc	 ${1}\\dotfiles\\.bashrc_cygwin"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_cygwin"
}

# MSYS2 links
function msys2_links_for_mypc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc	 ${1}\\dotfiles\\.bashrc_msys2"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_msys2"
}

#### Lab PC ####
## Common links
function common_links_for_labpc () {
  # Windows shortcuts
  \cmd /c "mklink /D ${1}\\Downloads C:\\Users\\Mamoru\\Downloads"
  \cmd /c "mklink /D ${1}\\Desktop   C:\\Users\\Mamoru\\Desktop"
  \cmd /c "mklink /D ${1}\\Documents C:\\Users\\Mamoru\\Documents"
  \cmd /c "mklink /D ${1}\\Pictures  C:\\Users\\Mamoru\\Pictures"
  \cmd /c "mklink /D ${1}\\Videos    C:\\Users\\Mamoru\\Videos"
  \cmd /c "mklink /D ${1}\\Music     C:\\Users\\Mamoru\\Music"
  \cmd /c "mklink /D ${1}\\Temp      C:\\Users\\Mamoru\\AppData\\Local\\Temp"

  # Google drive
  \cmd /c "mklink /D ${1}\\gdrive    C:\\Users\\mkami\\\"Google ドライブ\""
}

# Cygwin for Lab PC
function cygwin_links_for_labpc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc	 ${1}\\dotfiles\\.bashrc_cygwin"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_cygwin"
}

# MSYS2 for Lab PC
function msys2_links_for_labpc () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc	 ${1}\\dotfiles\\.bashrc_msys2"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_msys2"
}
########## Calls ##########

# Argument length check
if [ $# -ne 3 ]; then
  echo "Format error"
  echo "Usage:"
  echo "./create_link.sh <Home> <pc_flag> <terminal_flag>"
  echo "Execute with authorized account!:"
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
    msys2_links_for_mypc ${CONST_HOME}

  fi
elif [ $2 == ${CONST_LABPC} ]; then
  # For Lab PC
  common_links_for_labpc ${CONST_HOME}

  if [ $3 == ${CONST_CYGWIN} ]; then
    cygwin_links_for_labpc ${CONST_HOME}

  elif [ $3 == ${CONST_MSYS2} ]; then
    msys2_links_for_labpc ${CONST_HOME}

  fi
fi
