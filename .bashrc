#.bash.rc

##################################################################
# PCによってここを書き換える!!
##################################################################

MS_HOME="/cygdrive/c/Users/rsc95133"
SVN_LOCAL_PATH="${MS_HOME}/Documents/yui/ITF-2"

##################################################################
# alias
##################################################################

#カラースキームの設定
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'
#eval '$(dircolors -b /etc/DIR_COLORS)'
#source /etc/colorSchime/mintty-colors-solarized/sol.dark

#起動時
cd ~/

##################################################################
# alias
##################################################################

#ls: 詳細
alias ls='ls --color=auto --show-control-chars'
alias la='ls -la'

#nkfコマンドの簡易設定
alias u2w='nkf -w -Lw'
alias w2u='nkf -u -Lu'
alias u2wo='nkf -w -Lw --overwrite'
alias w2uo='nkf -u -Lu --overwrite'

#tree: カラー有効, 階層を指定
alias tree='tree -C -L'

#ディレクトリの削除
alias rmdir='rm -rf'

#ディレクトリごとコピー
alias cpdir='cp -r'

#新規ターミナルの立ち上げ
alias new='c /cygdrive/c/WinLinks/mintty.lnk'

#ウィンドウズアプリを含むプロセスの簡易表示
alias ps='ps -s -W'

#Doxygenでプロジェクト名のオーバーライド
function DoxygenProjectNameOverRide() {
    (cat ~/dotfiles/Doxyfile ; echo "PROJECT_NAME=${1}") | doxygen -;
}
alias Doxygen='DoxygenProjectNameOverRide'

##################################################################
# WindowsとCygwinの対応
##################################################################

#コマンドプロンプトの起動時オプション
alias cmd='Cmd /k 'C:\WinLinks\Cmd_ini.bat''

#ウィンドウズアプリを起動
alias c='cygstart'

#stop エクスプローラを停止
alias balse='taskkill /im explorer.exe /f'

##################################################################
# シンボリックリンクの設定
##################################################################

function make_lnk() {
    #homeから主要フォルダにアクセス
    ln -sf ${MS_HOME}/Desktop ${HOME}/Desktop;
    ln -sf ${MS_HOME}/Documents ${HOME}/Documents;
    ln -sf ${MS_HOME}/Downloads ${HOME}/Downloads;
    ln -sf ${MS_HOME}/Music ${HOME}/Music;
    ln -sf ${MS_HOME}/Pictures ${HOME}/Pictures;
    ln -sf ${MS_HOME}/Videos ${HOME}/Videos;

    #よく使うSVNのパスへのショートカット
    LNK_NAME="Powpic"
    ln -sf ${SVN_LOCAL_PATH}/code_share/"PIC(Pow)" ${HOME}/${LNK_NAME};
    LNK_NAME="Compic"
    ln -sf ${SVN_LOCAL_PATH}/code_share/"PIC(Com)" ${HOME}/${LNK_NAME};
    LNK_NAME="Cdh"
    ln -sf ${SVN_LOCAL_PATH}/"C&Dh" ${HOME}/${LNK_NAME};
    LNK_NAME="Uni"
    ln -sf ${SVN_LOCAL_PATH}/"C&Dh"/EagleUniversalBoardProjects ${HOME}/${LNK_NAME};
    LNK_NAME="Em"
    ln -sf ${SVN_LOCAL_PATH}/PCB/CDH/EM ${HOME}/${LNK_NAME};
    LNK_NAME="Fm"
    ln -sf ${SVN_LOCAL_PATH}/PCB/CDH/PFM ${HOME}/${LNK_NAME};
    LNK_NAME="Cdh"
    ln -sf ${SVN_LOCAL_PATH}/"C&DH" ${HOME}/${LNK_NAME};
    LNK_NAME="Command"
    ln -sf ${SVN_LOCAL_PATH}/"C&Dh"/コマンド処理 ${HOME}/${LNK_NAME};
}
alias Mklnk='make_lnk'

##################################################################
# オマケ
##################################################################

DATE_TEMP=`date|awk '{print $1 $2 $3 $5.}'`
echo "It is ${DATE_TEMP}"
