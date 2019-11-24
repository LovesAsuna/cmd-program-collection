@echo off & setlocal enabledelayedexpansion 
set reload=0 & set times=1
rem 导入自身位置
set file=%0 & set file=!file:run.cmd=! & set file=!file:"=! 
set file=%file: =%
rem 识别是否为Bungeecord核心
if exist BungeeCord.jar set jar=BungeeCord.jar && set server=BungeeCord && set status=bc && goto BungeeCord
rem 读取服务端核心
if not exist eula.txt title Default控制端 && set status=spigot && goto firstrun   
goto reload
:firstrun
echo eula=true>eula.txt
echo 第一次运行服务器,请为服务器命名,这将成为以后显示的服务器名称!
set /p server=输入服务器名称:
echo %server%>>eula.txt
echo 请设置最大内存和最小内存!
set /p max=最大内存(Max):
set /p min=最新内存(Min):
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
echo 检测到为Bungeecord模式且未经初始化 & title %server%控制端 & echo 请设置最大内存和最小内存!
set /p max=最大内存(Max):
set /p min=最小内存(Min):
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
title %server%控制端^|端口号:%port%(重启次数=%reload%)^|Max=%max%^|Min=%min%
java -Xmx%max% -Xms%min% -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dfile.encoding=UTF-8 -Dusing.aikars.flags=mcflags.emc.gs -jar %jar%
ping /n 1 127.0.0.1>nul & cls
choice /c cr /n /t 4 /d r /m 输入c即可关闭窗口！& cls

if "%errorlevel%"=="1" goto close
if "%errorlevel%"=="2" set /a reload=%reload%+1 && goto reloadnode

:close
for /l %%i in (5,-1,0) do (
  echo 窗口将在 %%i 秒内自动关闭!
  ping /n 2 127>nul
  cls
)