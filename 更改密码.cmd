@echo off & setlocal enabledelayedexpansion & title ��������
color 0a & set default=admin 
set times=3
if exist key.txt goto run 
echo admin>key.txt
goto run

:run
for /f "delims=+" %%i in (key.txt) do (
set default=%%i
)
set /p password=�������������У��:
if "%password%"=="%default%" goto current
echo Your password is wrong!This windows will be closed!
for /l %%i in (5,-1,0) do (
echo ʣ�� %%i ���Զ��˳���
ping /n 2 127>nul
cls
)
exit

:current
echo ������ȷ
cls
echo ����������
echo ��������
set /p repeat=��������:
if "%repeat%"=="%default%" goto change
goto wrong

:change
cls
set /p newpassword=����������:
echo %newpassword%>key.txt
pause
exit

:wrong
cls
echo ������� & set /a times=%times%-1
if %times%==0 exit
echo %times% chances
set /p repeat=��������:
if "%repeat%"=="%default%" goto change
goto :wrong

