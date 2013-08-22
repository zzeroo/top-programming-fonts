:: found here: https://github.com/zzeroo/top-programming-fonts
@ECHO OFF
SetLocal EnableDelayedExpansion
CLS

set ZZ_FONTS=(Menlo-Regular.ttf  MONACO.TTF)

FOR %%f IN %ZZ_FONTS% DO (
	CALL :DOWNLOAD %%f
	CALL :INSTALL %%f
)

ECHO "Restart Windows to activate the fonts ..."



::Funktions (or some thing like that M)

::A wget for Powershell
:Download
        IF "%1"=="" GOTO :EOF
        IF "%1"==" " GOTO :EOF
        Echo.Downloading: %1 to %TEMP%\\%1
        ::powershell.exe -Command "(new-object System.Net.WebClient).DownloadFile('https://raw.github.com/zzeroo/top-programming-fonts/master/%1','%TEMP%\%1')" >NUL
        powershell.exe -Command "(new-object System.Net.WebClient).DownloadFile('https://raw.github.com/zzeroo/top-programming-fonts/master/%1','%TEMP%\\%1')"
EXIT/B


::Hack the font name into the win reg
:INSTALL
	SET FFILE=%~n1%~x1
	SET FNAME=%~n1
	SET FNAME=%FNAME:-= %
	IF "%~x1"==".otf" SET FTYPE=(OpenType)
	IF "%~x1"==".ttf" SET FTYPE=(TrueType)
	
        ECHO FILE=%FFILE%
	ECHO NAME=%FNAME%
	ECHO TYPE=%FTYPE%
	
	::Copy in
	ECHO COPY /Y %TEMP%\%FFILE% %WINDIR%\FONTS\
	COPY /Y %TEMP%\%FFILE% %WINDIR%\FONTS\
	
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%FNAME% %FTYPE%" /t REG_SZ /d "%FFILE%" /f
EXIT/B
