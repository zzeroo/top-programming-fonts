:: found here: https://github.com/zzeroo/top-programming-fonts
@ECHO OFF
SetLocal EnableDelayedExpansion
CLS

set ZZ_FONTS_DIR=C:\Windows\Fonts
set ZZ_FONTS=("Menlo-Regular.ttf"  "Monaco.ttf")

FOR %%f IN %ZZ_FONTS% DO (
	CALL :LOOP %%f
)

PAUSE

:LOOP
	::Download
        IF "%1"=="" GOTO :EOF
        IF "%1"==" " GOTO :EOF
	Echo.Downloading: %1 to %TEMP%\%1
	powershell.exe -Command "(new-object System.Net.WebClient).DownloadFile('https://raw.github.com/zzeroo/top-programming-fonts/master/%1','%TEMP%\\%1')" >NUL
	
	::Copy in
        ECHO Copy Font: %1 to %ZZ_FONTS_DIR%\%1
	COPY /Y /B %TEMP%\%1 %ZZ_FONTS_DIR%\%1
	
	::Create regestry values
	ECHO REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v %1:~0,-4% /t REG_SZ /d %1 /f 
	REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v %1:~0,-4% /t REG_SZ /d %1 /f 
EXIT /B
