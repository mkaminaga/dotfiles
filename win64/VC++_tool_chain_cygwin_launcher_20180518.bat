@rem 2018/05/18 Cygwin launcher bat file for my PC
@rem Copyright (C) 2018 Mamoru Kaminaga
@rem See also http://qiita.com/mkaminaga/items/7e15dd3ca385780b31b5

@rem Specific directories.
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin
set LIBRARIES=C:\projects\library

@rem Binary path
set PATH=%PATH%;%VCINSTALLDIR%
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\bin\x86
set PATH=%PATH%;C:\projects\library\sqlite-tools-win32-x86-3300100

@rem Include path
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\shared
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\wrl
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt\xaml
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt
set INCLUDE=%INCLUDE%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC
set INCLUDE=%INCLUDE%;C:\projects\library\bulletml-0.0.5

@rem Library path
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\8.0\Lib\win8\um\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10240.0\ucrt\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib\store
set LIBPATH=%LIBPATH%;C:\projects\library\DxLibNoneModel_NoneSoftDrawCode_VC
set LIBPATH=%LIBPATH%;C:\projects\library\bulletml-0.0.5

@rem Direct X SDK Path
set PATH=%PATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x86

@rem Debugging tool and performance tool path
set _NT_SYMBOL_PATH=srv*C:\projects\symbols*http://msdl.microsoft.com/downloads/symbols
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\Debuggers\x86
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit
set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE

@rem Library Path
set LIB=%LIBPATH%;

@rem Terminal launched
start C:\cygwin64\bin\mintty -e C:\cygwin64\bin\bash.exe --login
