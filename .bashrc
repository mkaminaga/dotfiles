#.bash.rc

##################################################################
# alias
##################################################################

#カラースキームの設定
[ -z '$LS_COLORS' ] && eval '`dircolors -b /etc/DIR_COLORS`'




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
alias cmd='cmd /k 'C:\WinLinks\Cmd_ini.bat''

#ウィンドウズアプリを起動
alias c='cygstart'

#stop エクスプローラを停止
alias balse='taskkill /im explorer.exe /f'

##################################################################
# リンクの作成
##################################################################

SVN_LOCAL_PATH=/cygdrive/c/Documents/ITF-2

function make_lnk() {
    #homeから主要フォルダにアクセス
    ln -s -f /cygdrive/c/Users/Mamoru/Downloads    ~/Downloads;
    ln -s -f /cygdrive/c/Users/Mamoru/Desktop      ~/Desktop;
    ln -s -f /cygdrive/c/Users/Mamoru/Documents    ~/Documents;
    ln -s -f /cygdrive/c/Users/Mamoru/Pictures     ~/Pictures;
    ln -s -f /cygdrive/c/Users/Mamoru/Videos       ~/Videos;
    ln -s -f /cygdrive/c/Users/Mamoru/Music        ~/Music;

    #よく使うSVNのパスへのショートカット
    ln -s -f ${SVN_LOCAL_PATH}/code_share/"PIC(Pow)"  ~/Powpic;
    ln -s -f ${SVN_LOCAL_PATH}/code_share/"PIC(Com)"  ~/Compic;
    ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"/コマンド処理    ~/Command;
    ln -s -f ${SVN_LOCAL_PATH}/PCB/CDH/PFM            ~/FM;
    ln -s -f ${SVN_LOCAL_PATH}/PCB/CDH/EM             ~/EM;
    ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"                 ~/CDH;
}
alias Mklnk='make_lnk'

##################################################################
# オマケ
##################################################################

DATE_TEMP=`date|awk '{print $1 $2 $3 $5.}'`
echo "It is ${DATE_TEMP}"
