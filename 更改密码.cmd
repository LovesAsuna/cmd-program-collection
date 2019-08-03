@echo off & setlocal enabledelayedexpansion & title 更改密码
color 0a & set default=admin 
set times=3
if exist key.txt goto run 
echo admin>key.txt
goto run

:run
for /f "delims=+" %%i in (key.txt) do (
set default=%%i
)
set /p password=请输入密码进行校验:
if "%password%"=="%default%" goto current
echo Your password is wrong!This windows will be closed!
for /l %%i in (5,-1,0) do (
echo 剩余 %%i 秒自动退出！
ping /n 2 127>nul
cls
)
exit

:current
echo 密码正确
cls
echo 进入主界面
echo 更改密码
set /p repeat=输入密码:
if "%repeat%"=="%default%" goto change
goto wrong

:change
cls
set /p newpassword=输入新密码:
echo %newpassword%>key.txt
pause
exit

:wrong
cls
echo 密码错误！ & set /a times=%times%-1
if %times%==0 exit
echo %times% chances
set /p repeat=输入密码:
if "%repeat%"=="%default%" goto change
goto :wrong

