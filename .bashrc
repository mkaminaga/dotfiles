#.bashrc

# OS judgement
export MACHINE=''
uname_output="$(uname -s)"
case "${uname_output}" in
  Linux*)
    if [[ "$(uname -r)" == *microsoft* ]]; then
      export MACHINE='WSL'
    else
      export MACHINE='LINUX'
    fi
    ;;
  Darwin*)
    export MACHINE='MAC'
    ;;
  CYGWIN*)
    export MACHINE='CYGWIN'
    ;;
  MINGW*)
    export MACHINE='MINGW'
    ;;
  *)
    export MACHINE="UNKNOWN:${uname_output}"
    ;;
esac
echo "${0} MACHINE=${MACHINE}"

#---------------------------------------
# Global wrapper
#---------------------------------------
if [[ "${MACHINE}" == "WSL" ]]; then
  alias source='.'
fi

#---------------------------------------
# ls looks
#---------------------------------------
if [[ "${MACHINE}" == "MAC" ]]; then
  export LSCOLORS=cxfxcxdxbxegedabagacad
  echo "${0} ${MACHINE} LSCOLORS is set"
else
  [ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'
fi

export DISPLAY=:0
export HISTCONTROL=ignoredups
export HISTSIZE=30000

#---------------------------------------
# Custom environmental variables
# tips: '~' cannot be used from .bashrc
#---------------------------------------
if [[ "${MACHINE}" == "CYGWIN" ]]; then
  export DOTFILES_ROOT="/cygdrive/c/cygwin64/home/Mamoru/dotfiles"
  export CUSTOM_ROOT="/cygdrive/c/kaminaga"
else
  export DOTFILES_ROOT="/home/user/dotfiles"
  export CUSTOM_ROOT="/home/user"
fi
export DIR_SAVE_FILE_PATH="${CUSTOM_ROOT}/dir_save.txt"

#---------------------------------------
# Terminal launch path
#---------------------------------------
if [[ ! -e "${DIR_SAVE_FILE_PATH}" ]]; then
  echo ${CUSTOM_ROOT} > ${DIR_SAVE_FILE_PATH}
fi
cd $(cat ${DIR_SAVE_FILE_PATH})

#---------------------------------------
# Custom setting
#---------------------------------------
source "${DOTFILES_ROOT}/.bashrc.utils"
source "${DOTFILES_ROOT}/.bashrc.alias"
if [[ ! -e "${CUSTOM_ROOT}/.bashrc.myalias" ]]; then
  echo "# Add your original alias here." >> ${CUSTOM_ROOT}/.bashrc.myalias
else
source "${CUSTOM_ROOT}/.bashrc.myalias"
fi

if [[ "${MACHINE}" == "MAC" ]]; then
  # None
  :
else
  shopt -s globstar
fi

#---------------------------------------
# Git
#---------------------------------------
# Run dotfiles/install_git_tools.sh install following scripts
# - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [[ "${MACHINE}" == "MAC" ]]; then
  # None
  :
else
  shopt -s globstar
  source /usr/local/etc/git-completion.bash
  source /usr/local/etc/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=
  GIT_PS1_SHOWUNTRACKEDFILES=
  GIT_PS1_SHOWSTASHSTATE=1
  export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '
fi

#---------------------------------------
# General dotfiles
#---------------------------------------
# See also : dotfiles/dotfilelinks.sh

#---------------------------------------
# Windows dotfiles
#---------------------------------------
# See also : dotfiles/create_link.sh

#---------------------------------------
# Initialization
#---------------------------------------
echo `date "+It is %Y/%m/%d %H:%M:%S"`

