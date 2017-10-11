@rem 2017/04/18 Msys2 launcher bat file of my PC
@rem Copyright (C) 2017 Mamoru kaminaga
@rem See alse http://qiita.com/mkaminaga/items/7e15dd3ca385780b31b5

@rem Common EXE Path
set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\bin\HostX86\x86
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\10\bin\10.0.15063.0\x86

@rem Common Include Path
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\shared
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\include
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\ucrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt\wrl
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt\xaml

@rem Common Library Path
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\um\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\ucrt\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\lib\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\lib\x86\store

@rem Direct X SDK Path
set PATH=%PATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x86

@rem SGP4 library Path
set INCLUDE=%INCLUDE%;C:\projects\SGP4\cpp
set LIBPATH=%LIBPATH%;C:\projects\SGP4\cpp

@rem FBX SDK Path
set INCLUDE=%INCLUDE%;C:\Program Files\Autodesk\FBX\FBX SDK\2015.1\include
set LIBPATH=%LIBPATH%;C:\Program Files\Autodesk\FBX\FBX SDK\2015.1\lib\vs2013\x86\release
set LIBPATH=%LIBPATH%;C:\Program Files\Autodesk\FBX\FBX SDK\2015.1\lib\vs2013\x86\debug

@rem My git local repogitories
set INCLUDE=%INCLUDE%;C:\cygwin64\home\Mamoru\projects\library
set LIBPATH=%LIBPATH%;C:\cygwin64\home\Mamoru\projects\library

@rem Debugging tool path
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x86
set _NT_SYMBOL_PATH=srv*C:\Symbols*http://msdl.microsoft.com/download/symbols

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
set MSYS2_PATH_TYPE=inherit
start C:\msys64\msys2.exe
