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

@rem Debugging tool path
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\8.0\Debuggers\x64
set _NT_SYMBOL_PATH=srv*C:\Symbols*http://msdl.microsoft.com/download/symbols

@rem Library Path
set LIB=%LIBPATH%;

@rem Terminal launched
set MSYS2_PATH_TYPE=inherit
start C:\msys64\msys2.exe
