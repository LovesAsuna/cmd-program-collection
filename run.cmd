��a
cls
@echo off & setlocal enabledelayedexpansion 
set reload=0 & set times=1
rem ��������λ��
set file=%0 & set file=!file:run.cmd=! & set file=!file:"=! 
set file=%file: =%
rem ʶ���Ƿ�ΪBungeecord����
if exist BungeeCord.jar set jar=BungeeCord.jar && set server=BungeeCord && set status=bc && goto BungeeCord
rem ��ȡ����˺���
if not exist eula.txt title Default���ƶ� && set status=spigot && goto firstrun   
goto reload
:firstrun
echo eula=true>eula.txt
echo ��һ�����з�����,��Ϊ����������,�⽫��Ϊ�Ժ���ʾ�ķ���������!
set /p server=�������������:
echo %server%>>eula.txt
echo ����������ڴ����С�ڴ�!
set /p max=����ڴ�(Max):
set /p min=�����ڴ�(Min):
for /f "tokens=4" %%i in ('dir') do (
 echo %%i|findstr "jar" && echo %%i>>eula.txt
 cls
)
echo Max=%max%>>eula.txt & echo Min=%min%>>eula.txt
goto reload

:BungeeCord
for /f "tokens=3 delims=:" %%i in ('findstr /rc:"\<host\>" config.yml') do (
  set port=%%i 
)
if not exist %file%modules\settings.ini goto setbcmemory
for /f "tokens=2 delims==" %%i in (%file%modules\settings.ini) do (
		if "!times!"=="1" set max=%%i
		if "!times!"=="2" set min=%%i
		set /a times=!times!+1 
) 
goto reloadnode
:setbcmemory
cls & set port=25577
echo ��⵽ΪBungeecordģʽ��δ����ʼ�� & title %server%���ƶ� & echo ����������ڴ����С�ڴ�!
set /p max=����ڴ�(Max):
set /p min=��С�ڴ�(Min):
md %file%modules & cls
echo Max=%max%>>%file%modules\settings.ini & echo Min=%min%>>%file%modules\settings.ini
goto reloadnode
:reload
set status=spigot
for /f %%i in (eula.txt) do (
  if "!times!"=="2" set server=%%i
  if "!times!"=="3" set jar=%%i
  set /a times=!times!+1 
) 
set times=1
for /f "tokens=2 delims==" %%i in (eula.txt) do (
  if "!times!"=="2" set max=%%i
  if "!times!"=="3" set min=%%i
  set /a times=!times!+1
)
for /f "tokens=2 delims==" %%i in ('findstr /rc:"\<server-port\>" server.properties') do (
  set port=%%i
)
:reloadnode
title %server%���ƶ�^|�˿ں�:%port%(��������=%reload%)^|Max=%max%^|Min=%min%
java -Xmx%max% -Xms%min% -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dfile.encoding=UTF-8 -Dusing.aikars.flags=mcflags.emc.gs -jar %jar%
ping /n 1 127.0.0.1>nul & cls
choice /c cr /n /t 4 /d r /m ����c���ɹرմ��ڣ�& cls

if "%errorlevel%"=="1" goto close
if "%errorlevel%"=="2" set /a reload=%reload%+1 && goto reloadnode

:close
for /l %%i in (5,-1,0) do (
  echo ���ڽ��� %%i �����Զ��ر�!
  ping /n 2 127>nul
  cls
)