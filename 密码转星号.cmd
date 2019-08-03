@echo off & setlocal enabledelayedexpansion 
title 密码转星号
::引入变量库
call :values
:pswmain 
rem 必要的变量重定义
set save=
for /f "usebackq delims=" %%i in (`xcopy /w . 2^>nul`) do (
if not defined save set save=%%i
)
set save=%save:~-1%
set password=!password!!save!
if not defined save goto finish
set /a typetimes=%typetimes%+1
if %typetimes%==17 echo. & echo                           您的密码已超出限度请重新输入 && ping /n 2 127>nul & cls & goto All
::星号转换部分
set star=
for /l %%i in (1,1,%typetimes%) do (
	set star=!star!*
	)
cls
echo                                请键入16位以内密码
echo ==============================================================================
echo                            密码:%star% (%typetimes%)                
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
echo 剩余 %%i 秒自动退出！
ping /n 2 127>nul
cls
)
exit

:menu
echo 密码正确
goto eof










::变量
:values
set password=
set typetimes=0
::rem 分界线====================
