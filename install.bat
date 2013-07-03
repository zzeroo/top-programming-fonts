:: found here: https://github.com/zzeroo/top-programming-fonts
@ECHO OFF
SetLocal EnableDelayedExpansion
CLS

set ZZ_FONTS=("Menlo-Regular.ttf"  "Monaco.ttf")

FOR %%f IN %ZZ_FONTS% DO (
	CALL :FONT %%f
)

PAUSE

:LOOP
	SET FONT=%1
	
	::Download
        IF "%1"=="" GOTO :EOF
        IF "%1"==" " GOTO :EOF
	Echo.Downloading: %FONT% to %TEMP%\%FONT%
	powershell.exe -Command "(new-object System.Net.WebClient).DownloadFile('https://raw.github.com/zzeroo/top-programming-fonts/master/%FONT%','%TEMP%\\%FONT%')" >NUL
	
	::Copy in
        ECHO Copy %FONT% to %WINDIR%\FONTS\%FONT%
	COPY /Y /B %TEMP%\%1 %WINDIR%\FONTS\%FONT%
	
	::Create regestry values
	ECHO Add registry entry: ... 
	REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v %FONT:~0,-5% (TrueType)" /t REG_SZ /d %FONT% /f 
EXIT /B

:FONT
	SET FFILE=%~n1%~x1
	SET FNAME=%~n1
	SET FNAME=%FNAME:-= %
	IF "%~x1"==".otf" SET FTYPE=(OpenType)
	IF "%~x1"==".ttf" SET FTYPE=(TrueType)
	
	ECHO FILE=%FFILE%
	ECHO NAME=%FNAME%
	ECHO TYPE=%FTYPE%
	
	COPY /Y "%SRC%%~n1%~x1" "%SystemRoot%\Fonts\"
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%FNAME% %FTYPE%" /t REG_SZ /d "%FFILE%" /f
GOTO :EOF
