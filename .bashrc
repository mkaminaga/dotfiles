#.bash.rc

#カラースキームの設定
[ -z "$LS_COLORS" ] && eval "`dircolors -b /etc/DIR_COLORS`"
#eval "$(dircolors -b /etc/DIR_COLORS)"
#source /etc/colorSchime/mintty-colors-solarized/sol.dark

~/dotfiles/dotfileLink.sh

#--------------------------------------------------------------------------
#alias
#

#ls: 詳細

alias la='ls -la'

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

#クリップボードから貼り付け
#alias pbcopy='cat >/dev/clipboard'

#クリップボードにコピー
#alias pbpaste='cat /dev/clipboard'

#Doxygenでプロジェクト名のオーバーライド
function DoxygenProjectNameOverRide () {
    (cat ~/Doxyfile ; echo "PROJECT_NAME=$1") | doxygen -;
}
alias Doxygen='DoxygenProjectNameOverRide'

#------------------------------------------------------------------------
#Windowsとの対応

#コマンドプロンプトの起動オプション
alias cmd='cmd /k "C:\WinLinks\Cmd_ini.bat"'

#ウィンドウズアプリを起動
alias c=cygstart

#stop エクスプローラを停止
alias balse='taskkill /im explorer.exe /f'

#cygwinからclコンパイラを起動
#http://stackoverflow.com/questions/366928/invoking-cl-exe-msvc-compiler-in-cygwin-shell

#------------------------------------------------------------------------
#ジャンプ設定

#起動時
cd ~/

#ドキュメント
alias doc='cd /cygdrive/c/Users/rsc95133/Documents'

#デスクトップ
alias des='cd /cygdrive/c/Users/rsc95133/Desktop'

#ダウンロード
alias dow='cd /cygdrive/c/Users/rsc95133/Downloads'

#ピクチャ
alias pict='cd /cygdrive/c/Users/rsc95133/Pictures/'

#SVNローカルリポジトリの電源PICの作業フォルダ
alias powp='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/code_share/"PIC(Pow)"'

#SVNローカルリポジトリの電通信PICの作業フォルダ
alias comp='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/code_share/"PIC(Com)"'

#SVNローカルリポジトリのユニバサル基板の作業フォルダ
alias uni='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/"C&Dh"/EagleUniversalBoardProjects'

#SVNローカルリポジトリのEM基板の作業フォルダ
alias em='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/PCB/CDH/EM'

#SVNローカルリポジトリのPFM基板の作業フォルダ
alias fm='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/PCB/CDH/PFM'

#SVNローカルリポジトリのCDH系の作業フォルダ
alias cdh='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/"C&DH"'

#SVNローカルリポジトリの通信/コマンド
alias cmnd='cd /cygdrive/c/Users/rsc95133/Documents/yui/ITF-2/"C&Dh"/コマンド処理'

#------------------------------------------------------------------------
#オマケ
/cygdrive/c/Users/rsc95133/Documents/pro/ShellScripts/hello.sh

