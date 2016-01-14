#.bash.rc

##################################################################
# PCによってここを書き換える!!
##################################################################

MS_HOME="/cygdrive/c/Users/Mamoru"
SVN_LOCAL_PATH="${MS_HOME}/Documents/yuiProjcet/ITF-2"

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

alias la='ls -la'

#nkfコマンドの簡易設定
alias u2w='nkf -w -Lw'
alias w2u='nkf -u -Lu'
alias u2wo='nkf -w -Lw --overwrite'
alias w2uo='nkf -u -Lu --overwrite'

#ls: カラー有効
alias ls='ls --color=auto'

#tree: カラー有効, 階層を指定
alias tree='tree -C -L'

#ディレクトリの削除
alias rmdir='rm -rf'

#ディレクトリごとコピー
alias cpdir='cp -r'

#新規ターミナルの立ち上げ
alias new='c /cygdrive/c/WinLinks/terminal.lnk'

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

#
#homeから主要フォルダにアクセス
#
#デスクトップ
if [ ! -e ${HOME}/Desktop ]; then
    ln -s ${MS_HOME}/Desktop ${HOME}/Desktop;
fi

#ドキュメント
if [ ! -e ${HOME}/Documents ]; then
    ln -s ${MS_HOME}/Documents ${HOME}/Documents
fi

#ダウンロード
if [ ! -e ${HOME}/Downloads ]; then
    ln -s ${MS_HOME}/Downloads ${HOME}/Downloads
fi

#ミュージック
if [ ! -e ${HOME}/Music ]; then
    ln -s ${MS_HOME}/Music ${HOME}/Music
fi

#ピクチャ
if [ ! -e ${HOME}/Pictures ]; then
    ln -s ${MS_HOME}/Pictures ${HOME}/Pictures
fi

#ビデオ
if [ ! -e ${HOME}/Videos ]; then
    ln -s ${MS_HOME}/Videos ${HOME}/Videos
fi

#
#よく使うSVNのパスへのショートカット
#
#電源PICの作業フォルダ
LNK_NAME="Powpic"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/code_share/"PIC(Pow)" ${HOME}/${LNK_NAME}
fi

#電通信PICの作業フォルダ
LNK_NAME="Compic"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/code_share/"PIC(Com)" ${HOME}/${LNK_NAME}
fi

#ユニバサル基板の作業フォルダ
LNK_NAME="Uni"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/"C&Dh"/EagleUniversalBoardProjects ${HOME}/${LNK_NAME}
fi

#EM基板の作業フォルダ
LNK_NAME="Em"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/PCB/CDH/EM ${HOME}/${LNK_NAME}
fi

#PFM基板の作業フォルダ
LNK_NAME="Fm"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/PCB/CDH/PFM ${HOME}/${LNK_NAME}
fi

#CDH系の作業フォルダ
LNK_NAME="Cdh"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/"C&DH" ${HOME}/${LNK_NAME}
fi

#通信/コマンド
LNK_NAME="Command"
if [ ! -e ${HOME}/${LNK_NAME} ]; then
    ln -s ${SVN_LOCAL_PATH}/"C&Dh"/コマンド処理 ${HOME}/${LNK_NAME}
fi

##################################################################
# オマケ
##################################################################

echo 'hello!'
DATE_TEMP=`date|awk '{print $1 $2 $3 $5}'`
echo "It is ${DATE_TEMP}"
