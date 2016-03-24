#!/bin/sh

SVN_LOCAL_PATH=/cygdrive/d/Documents/ITF-2

#homeから主要フォルダにアクセス
ln -s -f /cygdrive/c/Users/Mamoru/Downloads			~/Downloads;
ln -s -f /cygdrive/c/Users/Mamoru/Desktop			~/Desktop;
ln -s -f /cygdrive/c/Users/Mamoru/Documents			~/Documents;
ln -s -f /cygdrive/c/Users/Mamoru/Pictures			~/Pictures;
ln -s -f /cygdrive/c/Users/Mamoru/Videos			~/Videos;
ln -s -f /cygdrive/c/Users/Mamoru/Music				~/Music;
ln -s -f /cygdrive/c/Users/Mamoru/"Google ドライブ" ~/Gdrive;

#よく使うSVNのパスへのショートカット
ln -s -f ${SVN_LOCAL_PATH}/code_share/"PIC(Pow)"	~/Powpic;
ln -s -f ${SVN_LOCAL_PATH}/code_share/"PIC(Com)"	~/Compic;
ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"/コマンド処理		~/Command;
ln -s -f ${SVN_LOCAL_PATH}/PCB/CDH/PFM				~/FM;
ln -s -f ${SVN_LOCAL_PATH}/PCB/CDH/EM				~/EM;
ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"					~/CDH;
