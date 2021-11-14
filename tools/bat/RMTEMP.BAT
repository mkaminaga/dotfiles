@rem date: 2020/04/20
@rem author: Mamoru Kaminaga
@rem about: Delete tempolary files.

@rem Delete default temp files and folders.
call :ClearFolder C:\Windows\Temp\*
call :ClearFolder C:\Users\Default\AppData\Local\Temp\*
call :ClearFolder C:\Users\%USERNAME%\AppData\Local\Temp\*
call :ClearFolder C:\Users\%USERNAME%\AppData\LocalLow\Temp\*

@rem Delete user temp files and folders.
call :ClearFolder C:\cygwin64\tmp\*
call :ClearFolder C:\Users\%USERNAME%\Desktop\temp\*

@rem pause

@rem Delete files and folders
:ClearFolder
	set TARGET=%1
	del /Q %TARGET%
	for /D %%1 in (%TARGET%) do rmdir /S /Q "%%1"
exit /b