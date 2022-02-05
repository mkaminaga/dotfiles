#.bashrc
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'
export DISPLAY=:0
export HISTCONTROL=ignoredups
export HISTSIZE=30000

#---------------------------------------
# Custom setting
#---------------------------------------
export DOTFILES_ROOT="/cygdrive/c/cygwin64/home/Mamoru/dotfiles"
export CUSTOM_ROOT="/cygdrive/c/kaminaga"
source "${DOTFILES_ROOT}/.bashrc.utils"
source "${DOTFILES_ROOT}/.bashrc.alias"

shopt -s globstar
SetSaveDirName

#---------------------------------------
# Git
#---------------------------------------
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source /usr/local/etc/git-completion.bash
source /usr/local/etc/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '

echo `date "+It is %Y/%m/%d %H:%M:%S"`

