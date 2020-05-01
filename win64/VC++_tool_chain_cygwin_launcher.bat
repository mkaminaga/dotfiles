@ECHO OFF
REM 2018/05/18 Cygwin launcher bat file for my PC
REM Copyright (C) 2018 Mamoru Kaminaga
REM See also http://qiita.com/mkaminaga/items/7e15dd3ca385780b31b5

REM ========================================
REM Constants.
REM ========================================
SET V32BIT=x86
SET V64BIT=x64
SET VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC
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
SET PATH=!PATH!;C:\projects\library\sqlite-tools-win32-x86-3300100

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
SET INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include
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
SET PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE

IF %1 == !V32BIT! (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x86

) ELSE (

SET PATH=!PATH!;C:\Program^ Files^ ^(x86^)\Windows^ Kits\8.1\Debuggers\x64

)

REM ========================================
REM Library Path
REM ========================================
SET LIB=%LIBPATH%;

REM ========================================
REM Miscellaneous
REM ========================================
SET PATH=%PATH%;C:\Program Files (x86)\MeCab\bin
SET PATH=%PATH%;C:\Program Files\LLVM\bin

REM ========================================
REM Terminal launched
REM ========================================
START C:\cygwin64\bin\mintty -e C:\cygwin64\bin\bash.exe --login

REM ========================================
REM End of BAT.
REM ========================================
ENDLOCAL

EXIT /B 0
