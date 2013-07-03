:: found here: https://github.com/zzeroo/top-programming-fonts
@ECHO OFF
SetLocal EnableDelayedExpansion
CLS

set ZZ_FONTS=("Menlo-Regular.ttf"  "Monaco.ttf")

FOR %%f IN %ZZ_FONTS% DO (
	CALL :FONT %%f
)

PAUSE

:FONT
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
GOTO :EOF
