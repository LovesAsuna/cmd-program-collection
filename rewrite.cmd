@echo off & setlocal enabledelayedexpansion
title Bytetestfor @All right reserverd by melody
rem ����Ƿ���cmd.exe
set cmdnumber=0
for /f "usebackq" %%i in (`tasklist^|findstr "cmd.exe"`) do (
  set /a cmdnumber=!cmdnumber!+1
  ) 
if "%cmdnumber%" geq "3" echo ��⵽������ִ�йر��Է�Ӱ����,���Ժ��ٴδ��ļ� && goto stop
for /f "usebackq tokens=2" %%i in (`tasklist^|findstr "cmd.exe"`) do (
  if not defined pid set pid=%%i
  )
echo [Debug]�˳���Pid:%pid%
rem д��������Ŀ¼
set /p cmd=
start "" "%cmd%"
cls
:oritestfor
rem ��һ�μ��
for /f "usebackq skip=6 tokens=3" %%i in (`dir /t:w !cmd!`) do (
 if not defined length set length=%%i
)
set oldlength=%length%
rem �ڶ��μ��
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
rem ���Ŀ�����pid
set xtimes=1
for /f "usebackq tokens=2" %%i in (`tasklist^|findstr /c:cmd.exe`) do (
  if "!xtimes!"=="2" set taskpid=%%i
  set /a xtimes=!xtimes!+1
  )
echo Ŀ�����pid:%taskpid%
taskkill /pid %taskpid%>nul 2>nul
echo ���¿�������..
start "" "%cmd%"
set /a times=%times%+1
goto testfor

:stop
ping /n 3 127>nul
taskkill /f /im cmd.exe /t