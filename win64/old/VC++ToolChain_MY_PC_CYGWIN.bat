@rem 2017/04/18 Cygwin launcher bat file of my PC
@rem Copyright (C) 2017 Mamoru kaminaga
@rem See alse http://qiita.com/mkaminaga/items/7e15dd3ca385780b31b5

set VCINSTALLDIR=%VCINSTALLDIR%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin

@rem Common EXE Path
rem set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\bin\HostX86\x86
rem set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\10\bin\10.0.15063.0\x86

set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin
rem set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\bin\x86
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.1\bin\x86
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\10\bin\x86\ucrt

@rem Common Include Path
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\shared
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\8.1\Include\winrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10150.0\ucrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include

@rem Common Library Path
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\8.0\Lib\win8\um\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86
set LIBPATH=%LIBPATH%;CC:\Program Files (x86)\Windows Kits\10\Lib\10.0.10240.0\ucrt\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib

@rem DxLib
set INCLUDE=%INCLUDE%;C:\projects\library\dxlib
set LIBPATH=%LIBPATH%;C:\projects\library\dxlib

@rem Direct X SDK Path
set PATH=%PATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x86

@rem SGP4 library Path
set INCLUDE=%INCLUDE%;C:\projects\SGP4\cpp
set LIBPATH=%LIBPATH%;C:\projects\SGP4\cpp

@rem FBX SDK Path
set INCLUDE=%INCLUDE%;C:\Program Files\Autodesk\FBX\FBX SDK\2017.0.1\include
set LIBPATH=%LIBPATH%;C:\Program Files\Autodesk\FBX\FBX SDK\2017.0.1\lib\vs2015\x86

@rem zlib and libpng path
set INCLUDE=%INCLUDE%;C:\projects\library\lpng1634;C:\projects\library\zlib
set LIBPATH=%LIBPATH%;C:\projects\library\lpng1634\projects\visualc71\Win32_LIB_Release;C:\projects\library\lpng1634\projects\visualc71\Win32_LIB_Release\ZLib

@rem My git local repogitories
set INCLUDE=%INCLUDE%;C:\cygwin64\home\Mamoru\projects\library
set LIBPATH=%LIBPATH%;C:\cygwin64\home\Mamoru\projects\library

@rem Debugging tool and performance tool path
set _NT_SYMBOL_PATH=srv*C:\Symbols*http://msdl.microsoft.com/download/symbols
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86
set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Team Tools\Performance Tools
set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE

@rem vecmath
set INCLUDE=%INCLUDE%;C:\projects\vecmath-c++-1.2-1.4

@rem Library Path
set LIB=%LIBPATH%;

@rem Terminal launched
start C:\cygwin64\bin\mintty -e C:\cygwin64\bin\bash.exe --login
