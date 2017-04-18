@rem 2017/04/18 Msys2 launcher bat file of my PC

@rem Visual Studio Community 2017
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86 8.1

@rem Direct X SDK (June 2010)
set PATH=%PATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\x86
set INCLUDE=%INCLUDE%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include
set LIBPATH=%LIBPATH%;C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Lib\x86
set LIB=%LIBPATH%;

@rem MSYS2 inherits environmental variables set in this bat file
set MSYS2_PATH_TYPE=inherit

@rem Terminal launched
start C:\msys64\msys2.exe
