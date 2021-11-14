#.bashrc
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'
export DISPLAY=:0
export HISTCONTROL=ignoredups
export HISTSIZE=30000

source .bashrc.utils
source .bashrc.alias

SetSaveDirName
shopt -s globstar

echo `date "+It is %Y/%m/%d %H:%M:%S"`
