@echo off & setlocal enabledelayedexpansion
color 0a & del /q 读取结果.txt>nul & cls & ping -n 1 127>nul
title 读取文件BY忘却的旋律
:main
cls
choice /c jdq /n /m "请选择模式:解密模式j  读取模式d"
if "%errorlevel%"=="1" goto jiemi
if "%errorlevel%"=="2" goto duqu
if "%errorlevel%"=="3" goto debug
rem 解密模式
:jiemi
choice /n /m 全屏模式?(Y/N)
if /i "%errorlevel%"=="1" goto mode
if /i "%errorlevel%"=="2" goto jiemi2
:mode
mode con lines=500 cols=500
goto jiemi2
:jiemi2
color 3f
cls & title 读取文件(解密模式)BY忘却的旋律
echo 拖入要解密的批处理:
set /p a=
set new=%a:"=%
set prefix=%new:~-4%
if /i "%prefix%" equ ".cmd" goto repare
if /i "%prefix%" equ ".bat" goto repare
cls
echo                          此文件为非批处理，请重新选择文件
ping/n 2 127>nul
goto jiemi2
:repare
for /f "usebackq delims=: " %%i in (`findstr/n . "%new%"`) do set line=%%i
for /l %%i in (0,1,%line%) do (
echo                              正在导入: %%i/%line%
ping /n 1 127>nul
cls
)
echo                                   导入成功
ping /n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%a%) do (
echo %%i
echo %%i>>读取结果.txt
)
pause>nul
exit
rem 读取模式
:duqu
color 3f
cls & title 读取文件(读取模式)BY忘却的旋律
echo 提示:
echo 文件优先自动读取txt为后缀的文件！
ping -n 2 127>nul & cls
dir /b|findstr "txt">文本.x || goto error
for /f "delims=" %%i in (文本.x) do (
  set f=%%i
  )
del 文本.x
echo 导入成功 & ping -n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%f%) do (
echo %%i
echo %%i>>读取结果.txt
)
start 读取结果.txt
exit
:error
del 文本.x
cls
echo 文本查找失败 & ping -n 2 127>nul & cls
echo 手动输入读取文件(可将文件拖入框内)：
set /p h=
echo 导入成功 & ping -n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%h%) do (
echo %%i
echo %%i>>读取结果.txt
)
if not exist 读取结果.txt more %h%>>读取结果.txt && more %h%
pause>nul
goto :eof


:debug
rem debug模式
title 文件读取debug模式
cls & for /f "delims=*" %%i in ("Windows文件读取debug模式") do (
 set video=%%i
 for /l %%j in (0,1,19) do set /p "=!video:~%%j,1!"<nul & ping /n 1 127>nul
) & ping /n 1 127>nul & cls
choice /c yn /n /m 全屏模式?(Y/N)
if %errorlevel%==1 mode con lines=500 cols=500
if %errorlevel%==2 goto run
:run
set /p file=拖入文件:
cls & for /f "delims=" %%i in (%file%) do (
  echo %%i
)
pause>nul
