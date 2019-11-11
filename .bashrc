#.bashrc
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'
export DISPLAY=:0

alias ls='ls --color=auto --show-control-chars'
alias la='ls -la -l -h'
alias sl='ls --color=auto --show-control-chars'

alias u2w='nkf -w -Lw'
alias w2u='nkf -u -Lu'
alias u2wo='nkf -w -Lw --overwrite'
alias w2uo='nkf -u -Lu --overwrite'

alias vim='vim -p'
alias vi='vim -p --noplugin -u ~/dotfiles/.vimrc_minimum'

alias tree='tree -C -L'

alias rmdir='rm -rf'

alias cpdir='cp -r'

TMPFILE='/tmp/TempFileForBashrc'
if [ ! -e ${TMPFILE} ]; then
  touch ${TMPFILE}
fi
function SetWakeupDir() {
  cd `cat ${TMPFILE}`
}
alias setWakeupDir='SetWakeupDir'

function New() {
  pwd > ${TMPFILE} && cygstart /cygdrive/c/cygwin64/bin/mintty -e /cygdrive/c/cygwin64/bin/bash.exe --login
}
alias new='New'

alias exit='pwd > ${TMPFILE} && exit'

alias ps='ps -s -W'

function DoxygenProjectNameOverRide() {
  if [ "${1}" = "" ]; then
    echo "No project name is specified";
    return;
  fi

  if [ "${2}" = "" ]; then
    echo "output dir is not specified";
    return;
  fi

  (cat ~/dotfiles/Doxyfile ;\
    echo "PROJECT_NAME=${1}";\
    echo "HTML_OUTPUT=${2}/${1}") | doxygen -\
    && cygstart ${2}/${1}/index.html;
}
alias doxygen='DoxygenProjectNameOverRide'

alias cl='cl /W4 /DUNICODE /D_UNICODE'

alias cpplint='cpplint.py --filter=-build/include'

alias cmd='cmd /k `cygpath -u ~/dotfiles/win64/CMD_INI.bat`'

alias c='cygstart'

alias balse='Balse'
function Balse() {
  taskkill /im explorer.exe /f
  c explorer
}

alias tsvn='TortoiseSVN'
function TortoiseSVN() {
  if [ "$1" = "commit" ]; then
    # commit
    if [ "$3" = "" ]; then
      echo "write log message!";
    else
      cygstart /cygdrive/c/"Program Files"/TortoiseSVN/bin/TortoiseProc.exe\
         /command:$1 \
         /path:`cygpath -w $2` \
         /logmsg:"\"$3\"" \
         /closeonend:1;
    fi
  else
    # update
    cygstart /cygdrive/c/"Program Files"/TortoiseSVN/bin/TortoiseProc.exe\
       /command:$1\
       /path:`cygpath -w $2` \
       /closeonend:1;
  fi
}

setWakeupDir
shopt -s globstar

echo `date "+It is %Y/%m/%d %H:%M:%S"`
cd /cygdrive/c/Users/mkami/Documents/Laboratory/
