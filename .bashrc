#.bash.rc

##################################################################
# alias
##################################################################

# ls: 詳細
alias ls='ls --color=auto --show-control-chars'
alias la='ls -la -l -h'

# vi, vimの起動は複数タブ
alias vim='vim -p'
alias vi='vi -p'

# tree: カラー有効, 階層を指定
alias tree='tree -C -L'

# cpplint (google cording style helper tool)
alias cpplint='cpplint.py'

# 開く
alias c='cygstart'

##################################################################
# オマケ
##################################################################
echo `date "+It is %Y/%m/%d %H:%M:%S"`

# カレントディレクトリでの新規ターミナルの立ち上げ(研究室PCでは無効)
TMPFILE='/tmp/TempFileForBashrc'
if [ ! -e ${TMPFILE} ]; then
  touch ${TMPFILE}
fi
function SetWakeupDir() {
  cd `cat ${TMPFILE}`
}
alias setWakeupDir='SetWakeupDir'

function New() {
  pwd > ${TMPFILE} && explorer win64/VC++ToolChain_MY_PC_CYGWIN.bat
}
alias exit='pwd > ${TMPFILE} && exit'

if [[ $(logname) = 'mkami' ]]; then
  cd /cygdrive/c/Users/mkami/Documents/Laboratory
else
  setWakeupDir
fi
