#!/bin/sh

#Windows
ln -s -f /cygdrive/c/Users/Mamoru/Downloads ~/Downloads;
ln -s -f /cygdrive/c/Users/Mamoru/Desktop   ~/Desktop;
ln -s -f /cygdrive/c/Users/Mamoru/Documents ~/Documents;
ln -s -f /cygdrive/c/Users/Mamoru/Pictures  ~/Pictures;
ln -s -f /cygdrive/c/Users/Mamoru/Videos    ~/Videos;
ln -s -f /cygdrive/c/Users/Mamoru/Music     ~/Music;
ln -s -f /cygdrive/c/Users/Mamoru/Temp      /cygdrive/c/Users/Mamoru/AppData/Local/Temp
#SVN
SVN_LOCAL_PATH=/cygdrive/c/Users/Mamoru/Documents/ITF-2
ln -s -f ${SVN_LOCAL_PATH}                  ~/ITF-2;
ln -s -f ${SVN_LOCAL_PATH}/"C&Dh"           ~/CDH;
ln -s -f ${SVN_LOCAL_PATH}/"地上局"         ~/groundStation;

#Univ
ln -s -f /cygdrive/c/Users/Mamoru/Documents/ut_lectures/Lab ~/Lab

#yui project
ln -s -f /cygdrive/c/Users/Mamoru/Documents/YUI ~/yui

#programming
ln -s -f /cygdrive/c/projects ~/projects

# gimp 2.0
ln -s -f /cygdrive/c/cygwin64/home/Mamoru/.gimp-2.8/palettes ~/gimpPalettes

#vim include completion dir setting
ln -s -f /cygdrive/c/"Program Files (x86)"/"Microsoft DirectX SDK (June 2010)"/Include  ~/.vim/dir/directx
