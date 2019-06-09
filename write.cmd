@echo off & setlocal enabledelayedexpansion
title Bytetestfor @All right reserverd by melody
rem 检测是否有cmd.exe
set cmdnumber=0
for /f "usebackq" %%i in (`tasklist^|findstr "cmd.exe"`) do (
  set /a cmdnumber=!cmdnumber!+1
  ) 
if "%cmdnumber%" geq "3" echo 检测到批处理，执行关闭以防影响检测,请稍后再次打开文件 && goto stop
for /f "usebackq tokens=2" %%i in (`tasklist^|findstr "cmd.exe"`) do (
  if not defined pid set pid=%%i
  )
echo [Debug]此程序Pid:%pid%
rem 写入批处理目录
set /p cmd=
start "" "%cmd%"
cls
:oritestfor
rem 第一次检测
for /f "usebackq skip=6 tokens=3" %%i in (`dir /t:w !cmd!`) do (
 if not defined length set length=%%i
)
set oldlength=%length%
rem 第二次检测
set times=0
:testfor
for /f "usebackq skip=6 tokens=3" %%i in (`dir /t:w !cmd!`) do (
 if not defined length!times! set length!times!=%%i
)
set newlength=!length%times%!
if "%newlength%" neq "%oldlength%" goto reload
set /a times=%times%+1
goto testfor
:reload
for /f "usebackq skip=6 tokens=3" %%i in (`dir /t:w !cmd!`) do (
 if not defined length set length=%%i
)
set oldlength=%newlength%
rem 检测目标程序pid
set xtimes=1
for /f "usebackq tokens=2" %%i in (`tasklist^|findstr /c:cmd.exe`) do (
  if "!xtimes!"=="2" set taskpid=%%i
  set /a xtimes=!xtimes!+1
  )
echo 目标程序pid:%taskpid%
taskkill /pid %taskpid%>nul 2>nul
echo 重新开启程序..
start "" "%cmd%"
set /a times=%times%+1
goto testfor

:stop
ping /n 3 127>nul
taskkill /f /im cmd.exe /t