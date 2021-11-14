#!/bin/sh

########## Description ##########
# Script to create link
# Usage:
# ./create_link.sh <Home> <pc_flag> <terminal_flag>
# Execute with authorized account!
#
# Example:
# 1) Cygwin on My Main PC
# ./create_link.sh C:\\cygwin64\\home\\${USER} pc1 cygwin
#
# 2) Msys on My Main PC
# ./create_link.sh C:\\msys64\\home\\${USER} pc1 msys2
#
# 3) Cygwin on My Secondary PC
# ./create_link.sh C:\\cygwin64\\home\\mkami pc2 cygwin
#
# 4) Msys on My Secondary PC
# ./create_link.sh C:\\msys64\\home\\mkami pc2 msys2

########## Constants ##########
# pc_flag, PC
CONST_PC1="pc1"
CONST_PC2="pc2"

# terminal_flag, Terminal
CONST_CYGWIN="cygwin"
CONST_MSYS2="msys2"

########## Functions ##########
#### Common ####
function common_links_for_all_pc () {
  # Vim (Symbolic links for windows)
  cmd /c "mklink /H C:\\Users\\${USER}\\.vimrc C:\\cygwin64\\home\\${USER}\\dotfiles\\.vimrc"
  cmd /c "mklink /H C:\\Users\\${USER}\\.gvimrc C:\\cygwin64\\home\\${USER}\\dotfiles\\.vimrc"
  cmd /c "mklink /H C:\\Users\\${USER}\\.ideavimrc C:\\cygwin64\\home\\${USER}\\dotfiles\\.ideavimrc"
  cmd /c "mklink /H C:\\Users\\${USER}\\.vrapperrc C:\\cygwin64\\home\\${USER}\\dotfiles\\.vrapperrc"

  # Unix type
  ./dotfilelinks.sh
}

#### My PC ####
## Common links
function common_links_for_pc1 () {
  # Windows shortcuts
  \cmd /c "mklink /D ${1}\\Downloads C:\\Users\\${USER}\\Downloads"
  \cmd /c "mklink /D ${1}\\Desktop   C:\\Users\\${USER}\\Desktop"
  \cmd /c "mklink /D ${1}\\Documents C:\\Users\\${USER}\\Documents"
  \cmd /c "mklink /D ${1}\\Pictures  C:\\Users\\${USER}\\Pictures"
  \cmd /c "mklink /D ${1}\\Videos    C:\\Users\\${USER}\\Videos"
  \cmd /c "mklink /D ${1}\\Music     C:\\Users\\${USER}\\Music"
  \cmd /c "mklink /D ${1}\\Temp      C:\\Users\\${USER}\\AppData\\Local\\Temp"

  # programming
  \cmd /c "mklink /D ${1}\\projects C:\\projects"
}

# Cygwin links
function cygwin_links_for_pc1 () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc   ${1}\\dotfiles\\.bashrc_cygwin"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_cygwin"
}

# MSYS2 links
function msys2_links_for_pc1 () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc   ${1}\\dotfiles\\.bashrc_msys2"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_msys2"
}

#### Lab PC ####
## Common links
function common_links_for_pc2 () {
  # Windows shortcuts
  \cmd /c "mklink /D ${1}\\Downloads C:\\Users\\mkami\\Downloads"
  \cmd /c "mklink /D ${1}\\Desktop   C:\\Users\\mkami\\Desktop"
  \cmd /c "mklink /D ${1}\\Documents C:\\Users\\mkami\\Documents"
  \cmd /c "mklink /D ${1}\\Pictures  C:\\Users\\mkami\\Pictures"
  \cmd /c "mklink /D ${1}\\Videos    C:\\Users\\mkami\\Videos"
  \cmd /c "mklink /D ${1}\\Music     C:\\Users\\mkami\\Music"
  \cmd /c "mklink /D ${1}\\Temp      C:\\Users\\mkami\\AppData\\Local\\Temp"
}

# Cygwin for Lab PC
function cygwin_links_for_pc2 () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc       ${1}\\dotfiles\\.bashrc_cygwin"
  \cmd /c "mklink /H ${1}\\.bash_profile ${1}\\dotfiles\\.bash_profile_cygwin"
}

# MSYS2 for Lab PC
function msys2_links_for_pc2 () {
  # Dotfiles (Local)
  \cmd /c "mklink /H ${1}\\.bashrc       ${1}\\dotfiles\\.bashrc_msys2"
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
if [ $2 != ${CONST_PC1} -a $2 != ${CONST_PC2} ]; then
  echo "Argument 2 error"
  echo "${CONST_PC1}"
  echo "${CONST_PC2}"
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
if [ $2 == ${CONST_PC1} ]; then
  # For My PC
  common_links_for_pc1 ${CONST_HOME}

  if [ $3 == ${CONST_CYGWIN} ]; then
    cygwin_links_for_pc1 ${CONST_HOME}

  elif [ $3 == ${CONST_MSYS2} ]; then
    msys2_links_for_pc1 ${CONST_HOME}

  fi
elif [ $2 == ${CONST_PC2} ]; then
  # For Lab PC
  common_links_for_pc2 ${CONST_HOME}

  if [ $3 == ${CONST_CYGWIN} ]; then
    cygwin_links_for_pc2 ${CONST_HOME}

  elif [ $3 == ${CONST_MSYS2} ]; then
    msys2_links_for_pc2 ${CONST_HOME}

  fi
fi

