@echo off & setlocal enabledelayedexpansion 
title ����ת�Ǻ�
::���������
call :values
:pswmain 
rem ��Ҫ�ı����ض���
set save=
for /f "usebackq delims=" %%i in (`xcopy /w . 2^>nul`) do (
if not defined save set save=%%i
)
set save=%save:~-1%
set password=!password!!save!
if not defined save goto finish
set /a typetimes=%typetimes%+1
if %typetimes%==17 echo. & echo                           ���������ѳ����޶����������� && ping /n 2 127>nul & cls & goto All
::�Ǻ�ת������
set star=
for /l %%i in (1,1,%typetimes%) do (
	set star=!star!*
	)
cls
echo                                �����16λ��������
echo ==============================================================================
echo                            ����:%star% (%typetimes%)                
echo ==============================================================================
goto pswmain
:finish
for /f "delims=+" %%i in (key.txt) do (
set default=%%i
)
if "%password%"=="%default%" goto menu
echo Your password is wrong!This windows will be closed!
rd %temp%\psw /s/q 2>nul
for /l %%i in (5,-1,0) do (
echo ʣ�� %%i ���Զ��˳���
ping /n 2 127>nul
cls
)
exit

:menu
echo ������ȷ
goto eof










::����
:values
set password=
set typetimes=0
::rem �ֽ���====================
