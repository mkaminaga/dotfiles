@ECHO OFF
REM 2018/05/18 Cygwin launcher bat file for my PC
REM Copyright (C) 2021 Mamoru Kaminaga
REM
REM Update 2021/08/11 Update:
REM  * Visual Studio(2015->2019), Python, MediaPipe, Android
REM  * Sort definitions
REM    - TOOL_SPECIFIC_VARIABLES
REM    - PATH
REM    - INCLUDE
REM    - LIBPATH
REM

REM ========================================
REM Common Constants.
REM ========================================
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
REM Windows SDK
REM ========================================
SET _NT_SYMBOL_PATH=srv*C:\projects\symbols*http://msdl.microsoft.com/downloads/symbols
REM SET WIN_SDK_VERSION=10.0.10240.0
SET WIN_SDK_VERSION=8.1
SET PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\shared
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\um
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\wrl
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\xaml
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt

IF %1 == x86 (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Lib\winv6.3\um\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.0\Lib\win8\um\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\10\Lib\10.0.10240.0\ucrt\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Lib\winv6.3\um\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.0\Lib\win8\um\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\10\Lib\10.0.10240.0\ucrt\x64

)

REM ========================================
REM Visual Studio
REM ========================================
SET VC_VERSION=14.29.30037
SET VCINSTALLDIR=C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC
SET PATH=%PATH%;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\Common7\IDE
SET INCLUDE=%INCLUDE%;%VCINSTALLDIR%\Tools\MSVC\%VC_VERSION%\include

IF %1 == x86 (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC\Tools\MSVC\!VC_VERSION!\bin\Hostx64\x86
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\Tools\MSVC\!VC_VERSION!lib
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\Tools\MSVC\!VC_VERSION!lib\store

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\Community\VC\Tools\MSVC\!VC_VERSION!\bin\Hostx64\x64
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\Tools\MSVC\!VC_VERSION!lib\amd64
SET LIBPATH=!LIBPATH!;!VCINSTALLDIR!\Tools\MSVC\!VC_VERSION!lib\store\amd64

)

REM ========================================
REM DxLib
REM ========================================
SET INCLUDE=%INCLUDE%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC
SET LIBPATH=%LIBPATH%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC

REM ========================================
REM Bullet ML
REM ========================================
SET INCLUDE=%INCLUDE%;C:\projects\library\bulletml-0.0.5
SET INCLUDE=%INCLUDE%;C:\projects\library\bulletml-0.0.5\src
SET LIBPATH=%LIBPATH%;C:\projects\library\bulletml-0.0.5
SET LIBPATH=%LIBPATH%;C:\projects\library\bulletml-0.0.5\src

REM ========================================
REM Direct X
REM ========================================
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include

IF %1 == x86 (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Utilities\bin\x86
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Lib\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Utilities\bin\x64
SET LIBPATH=!LIBPATH!;C:\Program^ Files^ ^(x86^)\Microsoft^ DirectX^ SDK^ ^(June^ 2010^)\Lib\x64

)

REM ========================================
REM Open CV
REM ========================================
IF %1 == x86 (

REM 64bit only

) ELSE (

SET PATH=!PATH!;C:\projects\library\opencv\opencv-3.4.15\build\bin
SET PATH=!PATH!;C:\projects\library\opencv\opencv-3.4.15\build\x64\vc15\bin
SET LIBPATH=!LIBPATH!;C:\projects\library\opencv\opencv-3.4.15\build\x64\vc15\lib

)

REM ========================================
REM Python
REM ========================================
IF %1 == x86 (

REM 64bit only

) ELSE (

SET PYTHON_BIN_PATH=C:\Users\Mamoru\AppData\Local\Programs\Python\Python39\python.exe
SET PATH=!PATH!;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python39
SET PATH=!PATH!;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python39\Scripts

)

REM ========================================
REM Android
REM ========================================
SET ANDROID_NDK_VERSION=22.1.7171670
SET ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk
SET ANDROID_NDK_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk\ndk\%ANDROID_NDK_VERSION%
SET PATH=%PATH%;C:\android\platform-tools

REM ========================================
REM Bazel
REM ========================================
SET BAZEL_VS=C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\BuildTools
SET BAZEL_VC=C:\Program^ Files^ ^(x86^)\Microsoft^ Visual^ Studio\2019\BuildTools\VC
SET BAZEL_VC_FULL_VERSION=%VC_VERSION%
SET BAZEL_WINSDK_FULL_VERSION=%WIN_SDK_VERSION%
SET PATH=%PATH%;C:\projects\tools\bazel

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
