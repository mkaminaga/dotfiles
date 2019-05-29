#.bash.rc

##################################################################
# alias
##################################################################

# カラースキームの設定
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'

##################################################################
# post process
##################################################################
export DISPLAY=:0

##################################################################
# alias
##################################################################

# ls: 詳細
alias ls='ls --color=auto --show-control-chars'
alias la='ls -la -l -h'

# nkfコマンドの簡易設定
alias u2w='nkf -w -Lw'
alias w2u='nkf -u -Lu'
alias u2wo='nkf -w -Lw --overwrite'
alias w2uo='nkf -u -Lu --overwrite'

# vi, vimの起動は複数タブ
alias vim='vim -p'
alias vi='vi -p'

# tree: カラー有効, 階層を指定
alias tree='tree -C -L'

# vim, viの起動時はタブ
alias vim='vim -p'
alias vi='vi -p'

# ディレクトリの削除
alias rmdir='rm -rf'

# ディレクトリごとコピー
alias cpdir='cp -r'

# カレントディレクトリでの新規ターミナルの立ち上げ
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

# ウィンドウズアプリを含むプロセスの簡易表示
alias ps='ps -s -W'

#Doxygenでプロジェクト名のオーバーライド
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

# Compiler opption
alias cl='cl /W4 /DUNICODE /D_UNICODE'

# cpplint (google cording style helper tool)
alias cpplint='cpplint.py --filter=-build/include'

##################################################################
# WindowsとCygwinの対応
##################################################################

# コマンドプロンプトの起動時オプション
alias cmd='cmd /k `cygpath -u ~/dotfiles/win64/CMD_INI.bat`'

# ウィンドウズアプリを起動
alias c='cygstart'

# stop エクスプローラを停止
alias balse='taskkill /im explorer.exe /f'

# TortiseSVNコマンドを使いやすくしておく
alias tsvn='TortoiseSVN'
function TortoiseSVN() {

  # 空コミットを許可しない
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

##################################################################
# 起動時設定
##################################################################
setWakeupDir
shopt -s globstar

##################################################################
# オマケ
##################################################################
echo `date "+It is %Y/%m/%d %H:%M:%S"`
cd /cygdrive/c/Users/mkami/Documents/Laboratory/
