@echo off & setlocal enabledelayedexpansion 
set reload=0 & set times=1
rem ʶ���Ƿ�ΪBungeecord����
if exist modules set jar=BungeeCord.jar && set server=BungeeCord && set status=bc && for /f "tokens=3 delims=:" %%i in ('findstr /rc:"\<host\>" config.yml') do (
  set port=%%i
) && goto reloadnode
rem ��ȡ����˺���
if not exist eula.txt title Default���ƶ� && set status=spigot && goto firstrun   
goto reload
:firstrun
echo eula=true>eula.txt
echo ��һ�����з�����,��Ϊ����������,�⽫��Ϊ�Ժ���ʾ�ķ���������!
set /p server=�������������:
echo %server%>>eula.txt
for /f "tokens=4" %%i in ('dir') do (
 echo %%i|findstr "jar" && echo %%i>>eula.txt
 cls
)
goto reload

:reload
set status=spigot
for /f %%i in (eula.txt) do (
  if "!times!"=="2" set server=%%i
  set /a times=!times!+1
)
for /f %%i in (eula.txt) do set jar=%%i
for /f "tokens=2 delims==" %%i in ('findstr /rc:"\<server-port\>" server.properties') do (
  set port=%%i
)
:reloadnode
title %server%���ƶ�^|�˿ں�:%port%(��������=%reload%)
java -Xms6G -Xmx6G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar %jar%
ping /n 1 127.0.0.1>nul & cls
choice /c cr /n /t 4 /d r /m ����c���ɹرմ��ڣ�& cls
if %status%==spigot (
if "%errorlevel%"=="1" goto close
if "%errorlevel%"=="2" set /a reload=%reload%+1 && goto reload
)
if %status%==bc (
if "%errorlevel%"=="1" goto close
if "%errorlevel%"=="2" set /a reload=%reload%+1 && goto reloadnode
)
:close
for /l %%i in (5,-1,0) do (
  echo ���ڽ��� %%i �����Զ��ر�!
  ping /n 2 127>nul
  cls
)