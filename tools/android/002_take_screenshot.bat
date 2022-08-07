cd %~dp0

@set echo off

set DIRECTORY=/sdcard
set FILENAME=screen_capture.png

adb shell screencap -p %DIRECTORY%/%FILENAME%
adb pull %DIRECTORY%/%FILENAME% %~dp0
adb shell rm %DIRECTORY%/%FILENAME%

rename %FILENAME% screenshot_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png
