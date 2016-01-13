#.bash.rc

#PCごとのフォルダ階層を適用
USER_NAME="rsc95133"
SVN_REPOSITORY_NAME="yui"

#カラースキームの設定
[ -z "$LS_COLORS" ] && eval "`dircolors -b /etc/DIR_COLORS`"
#eval "$(dircolors -b /etc/DIR_COLORS)"
#source /etc/colorSchime/mintty-colors-solarized/sol.dark

#Githubリポジトリを活用してドットファイルを管理
~/dotfiles/dotfileLink.sh

#----
#alias
#

#ls: 詳細

alias la='ls -la'

#nkfコマンドの簡易設定
alias u2w='nkf -w -Lw'
alias u2wo='nkf -w -Lw --overwrite'
alias w2u='nkf -u -Lu'
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
function DoxygenProjectNameOverRide () {
    (cat ~/dotfiles/Doxyfile ; echo "PROJECT_NAME=$1") | doxygen -;
}
alias Doxygen='DoxygenProjectNameOverRide'

#----
#WindowsとCygwinの対応

#コマンドプロンプトの起動オプション
alias cmd='cmd /k "C:\WinLinks\Cmd_ini.bat"'

#ウィンドウズアプリを起動
alias c=cygstart

#stop エクスプローラを停止
alias balse='taskkill /im explorer.exe /f'

#----
#シンボリックリンクの設定

#起動時
cd ~/

#ドキュメント
LINK_NAME="Documents"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents ~/${LINK_NAME};
fi

#デスクトップ
LINK_NAME="Desktop"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Desktop ~/${LINK_NAME}
fi

#ダウンロード
LINK_NAME="Downloads"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Downloads ~/${LINK_NAME}
fi

#ピクチャ
LINK_NAME="Pictures"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Pictures/ ~/${LINK_NAME}
fi

#SVNローカルリポジトリの電源PICの作業フォルダ
LINK_NAME="Powpic"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/code_share/"PIC(Pow)" ~/${LINK_NAME}
fi

#SVNローカルリポジトリの電通信PICの作業フォルダ
LINK_NAME="Compic"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/code_share/"PIC(Com)" ~/${LINK_NAME}
fi

#SVNローカルリポジトリのユニバサル基板の作業フォルダ
LINK_NAME="Uni"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/"C&Dh"/EagleUniversalBoardProjects ~/${LINK_NAME}
fi

#SVNローカルリポジトリのEM基板の作業フォルダ
LINK_NAME="Em"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/PCB/CDH/EM ~/${LINK_NAME}
fi

#SVNローカルリポジトリのPFM基板の作業フォルダ
LINK_NAME="Fm"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/PCB/CDH/PFM ~/${LINK_NAME}
fi

#SVNローカルリポジトリのCDH系の作業フォルダ
LINK_NAME="Cdh"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/"C&DH" ~/${LINK_NAME}
fi

#SVNローカルリポジトリの通信/コマンド
LINK_NAME="Cmnd"
if [ "`find ~/ -maxdepth 1 -name ${LINK_NAME}`" != /home/${USER_NAME}/${LINK_NAME} ]; then
    ln -s /cygdrive/c/Users/${USER_NAME}/Documents/${SVN_REPOSITORY_NAME}/ITF-2/"C&Dh"/コマンド処理 ${LINK_NAME}
fi

#----
#オマケ
echo "hello!"
DATE_TEMP=`date|awk '{print $1 $2 $3 $5}'`
echo "It is ${DATE_TEMP}"
