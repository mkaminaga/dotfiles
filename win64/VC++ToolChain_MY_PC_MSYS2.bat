@rem 2017/04/18 Msys2 launcher bat file of my PC

set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\bin\HostX86\x86
set PATH=%PATH%;C:\Program Files (x86)\Windows Kits\10\bin\10.0.15063.0\x86

@rem Common Include files
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\shared
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\um
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\include
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\ucrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt\wrl
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Windows Kits\10\Include\10.0.15063.0\winrt\xaml

@rem Common Library files
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\um\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.15063.0\ucrt\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\lib\x86
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.10.25017\lib\x86\store

@rem Direct X SDK files
set PATH=%PATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x86

@rem Library
set LIB=%LIBPATH%;

@rem MSYS2 inherits environmental variables set in this bat file
set MSYS2_PATH_TYPE=inherit

@rem Terminal launched
start C:\msys64\msys2.exe
