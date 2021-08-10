@ECHO OFF
REM 2018/05/18 Cygwin launcher bat file for my PC
REM Copyright (C) 2018 Mamoru Kaminaga
REM See also http://qiita.com/mkaminaga/items/7e15dd3ca385780b31b5
REM
REM Update 2021/08/10 Update:
REM  * Visual Studio(2015->2019), Python, MediaPipe, Android

REM ========================================
REM Constants.
REM ========================================
SET V32BIT=x86
SET V64BIT=x64
SET LIBRARIES=C:\projects\library

REM ========================================
REM Argument check.
REM ========================================
IF %1 == x86 (

ECHO "32 bit environment"

) ELSE IF %1 == x64 (

ECHO "64 bit environment"

) ELSE (

ECHO ON
ECHO "Environment not specified"
EXIT /B 1

)

SETLOCAL ENABLEDELAYEDEXPANSION

REM ========================================
REM Path for binaries.
REM ========================================
SET PATH=%PATH%;%VCINSTALLDIR%\bin
IF %1 == !V32BIT! (

SET PATH=!PATH!;!VCINSTALLDIR!\bin\x86

) ELSE (

SET PATH=!PATH!;!VCINSTALLDIR!\bin\x86_amd64

)

REM ========================================
REM Include path
REM ========================================
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\shared
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\um
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\wrl
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\xaml
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt
SET INCLUDE=%INCLUDE%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC
SET INCLUDE=%INCLUDE%;C:\projects\library\bulletml-0.0.5
SET INCLUDE=%INCLUDE%;C:\projects\library\bulletml-0.0.5\src

REM ========================================
REM Library path
REM ========================================
SET LIBPATH=%LIBPATH%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC
SET LIBPATH=%LIBPATH%;C:\projects\library\bulletml-0.0.5
SET LIBPATH=%LIBPATH%;C:\projects\library\bulletml-0.0.5\src

IF %1 == !V32BIT! (

SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\lib
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\lib\store
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Lib\winv6.3\um\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.0\Lib\win8\um\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\10\Lib\10.0.10240.0\ucrt\x86

) ELSE (

SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\lib\amd64
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\lib\store\amd64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Lib\winv6.3\um\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.0\Lib\win8\um\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\10\Lib\10.0.10240.0\ucrt\x64
)

REM ========================================
REM Direct X SDK Path
REM ========================================
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include

IF %1 == !V32BIT! (
SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Utilities\bin\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Lib\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Utilities\bin\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Lib\x64

)

REM ========================================
REM Debugging tool and performance tool path
REM ========================================
SET _NT_SYMBOL_PATH=srv*C:\projects\symbols*http://msdl.microsoft.com/downloads/symbols
SET PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit

IF %1 == !V32BIT! (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x64

)

REM ========================================
REM Windows SDK
REM ========================================
REM SET WIN_SDK_VERSION=10.0.10240.0
SET WIN_SDK_VERSION=8.1

REM ========================================
REM Visual Studio
REM ========================================
SET VC_VERSION=14.29.30037
SET VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC
SET PATH=%PATH%;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\Common7\IDE
SET INCLUDE=%INCLUDE%;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC\Tools\MSVC\%VC_VERSION%\include

IF %1 == !V32BIT! (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC\Tools\MSVC\!VC_VERSION!\bin\Hostx64\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC\Tools\MSVC\!VC_VERSION!\bin\Hostx64\x64

)

REM ========================================
REM Open CV
REM ========================================
IF %1 == !V32BIT! (

REM 64bit only

) ELSE (

SET PATH=!PATH!;C:\projects\library\opencv\opencv-3.4.15\build\bin
SET PATH=!PATH!;C:\projects\library\opencv\opencv-3.4.15\build\x64\vc15\bin
SET LIBPATH=!LIBPATH!;C:\projects\library\opencv\opencv-3.4.15\build\x64\vc15\lib

)

REM ========================================
REM Python
REM ========================================
IF %1 == !V32BIT! (

REM 64bit only

) ELSE (

SET PATH=!PATH!;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python39
SET PATH=!PATH!;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python39\Scripts
SET PYTHON_BIN_PATH=C:\Users\Mamoru\AppData\Local\Programs\Python\Python39\python.exe

)

REM ========================================
REM Android
REM ========================================
SET PATH=%PATH%;C:\android\platform-tools
SET ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk
SET ANDROID_NDK_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk\ndk-bundle

REM ========================================
REM Bazel
REM ========================================
SET PATH=%PATH%;C:\projects\tools\bazel
SET BAZEL_VS=C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\BuildTools
SET BAZEL_VC=C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\BuildTools\VC
SET BAZEL_VC_FULL_VERSION=%VC_VERSION%
SET BAZEL_WINSDK_FULL_VERSION=%WIN_SDK_VERSION%

REM ========================================
REM Other Tools
REM ========================================
SET PATH=%PATH%;C:\projects\library\sqlite-tools-win32-x86-3300100
SET PATH=%PATH%;C:\Program Files (x86)\MeCab\bin
SET PATH=%PATH%;C:\Program Files\LLVM\bin

REM ========================================
REM Library Path
REM ========================================
SET LIB=%LIBPATH%;

REM ========================================
REM Terminal launched
REM ========================================
START C:\cygwin64\bin\mintty -e C:\cygwin64\bin\bash.exe --login

REM ========================================
REM End of BAT.
REM ========================================
ENDLOCAL

EXIT /B 0
