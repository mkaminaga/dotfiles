cd %~dp0
chcp 65001

SET PACKAGENAME=com.DefaultCompany.YourApplicationName
SET APKLOCATION=YourApplicationName.apk

@REM Install application application.
@REM adb shell pm clear %PACKAGENAME%
adb install -r %APKLOCATION%

@REM Check for activity names.
adb shell pm dump %PACKAGENAME% | findstr main

pause
