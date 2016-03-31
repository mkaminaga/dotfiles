#!/bin/sh

#Windows
ln -s -f /cygdrive/c/Users/Mamoru/Downloads	~/Downloads;
ln -s -f /cygdrive/c/Users/Mamoru/Desktop	~/Desktop;
ln -s -f /cygdrive/c/Users/Mamoru/Documents	~/Documents;
ln -s -f /cygdrive/c/Users/Mamoru/Pictures	~/Pictures;
ln -s -f /cygdrive/c/Users/Mamoru/Videos	~/Videos;
ln -s -f /cygdrive/c/Users/Mamoru/Music		~/Music;

#SVN
SVN_LOCAL_PATH=/cygdrive/c/Users/Mamoru/Documents/ITF-2
ln -s -f ${SVN_LOCAL_PATH}							~/ITF-2;
ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"					~/CDH;

#Google Drive
ln -s -f /cygdrive/c/Users/Mamoru/"Google ドライブ"	~/Gdrive

#vim include completion dir setting
ln -s -f /cygdrive/c/DxLib_VC/Lib	~/.vim/dir/dxlib
ln -s -f /cygdrive/c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include	~/.vim/dir/directx
