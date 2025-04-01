@echo off
setlocal
set FileName=cut.gc
set FileTime=-
:loop
for %%X in (%FileName%) do (
    if %FileTime% NEQ "%%~tX" (
        rem just an example
	cls
	C:\_tocut\curl.exe -F 'path=/' -F "myfile=@C:\_tocut\cut.gc" http://192.168.10.37/upload
	echo ""
	rem http://www.nirsoft.net/utils/nircmd.html
	nircmd.exe mediaplay 1000 "C:\Windows\Media\notify.wav"
    )
    set FileTime="%%~tX"
)
rem wait 5 seconds before checking again
ping -n 6 localhost >nul 2>nul
goto :loop