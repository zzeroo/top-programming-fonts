@ECHO OFF
SetLocal EnableDelayedExpansion
CLS

set ZZ_FONTS_DIR=C:\Windows\Fonts
set ZZ_FONTS=("Menlo-Regular.ttf"  "MONACO.TTF")

FOR %%f IN %ZZ_FONTS% DO (
	CALL :LOOP %%f
)


:LOOP
        IF "%1"=="" GOTO :EOF
        IF "%1"==" " GOTO :EOF
	Echo.Downloading: %1 to %TEMP%\%1
	powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://raw.github.com/zzeroo/top-programming-fonts/master/%1','%TEMP%\\%1') >NUL
	ECHO Copy Font: %1 to %ZZ_FONTS_DIR%\%1
	COPY /Y /B "%TEMP%\%1" "%USERPROFILE%\"
EXIT /B
