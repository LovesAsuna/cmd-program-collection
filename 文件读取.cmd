��a
cls
@echo off & setlocal enabledelayedexpansion
color 0a & del /q ��ȡ���.txt>nul & cls & ping -n 1 127>nul
title ��ȡ�ļ�BY��ȴ������
:main
cls
choice /c jdq /n /m "��ѡ��ģʽ:����ģʽj  ��ȡģʽd"
if "%errorlevel%"=="1" goto jiemi
if "%errorlevel%"=="2" goto duqu
if "%errorlevel%"=="3" goto debug
rem ����ģʽ
:jiemi
choice /n /m ȫ��ģʽ?(Y/N)
if /i "%errorlevel%"=="1" goto mode
if /i "%errorlevel%"=="2" goto jiemi2
:mode
mode con lines=500 cols=500
goto jiemi2
:jiemi2
color 3f
cls & title ��ȡ�ļ�(����ģʽ)BY��ȴ������
echo ����Ҫ���ܵ�������:
set /p a=
set new=%a:"=%
set prefix=%new:~-4%
if /i "%prefix%" equ ".cmd" goto repare
if /i "%prefix%" equ ".bat" goto repare
cls
echo                          ���ļ�Ϊ��������������ѡ���ļ�
ping/n 2 127>nul
goto jiemi2
:repare
for /f "usebackq delims=: " %%i in (`findstr/n . "%new%"`) do set line=%%i
for /l %%i in (0,1,%line%) do (
echo                              ���ڵ���: %%i/%line%
ping /n 1 127>nul
cls
)
echo                                   ����ɹ�
ping /n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%a%) do (
echo %%i
echo %%i>>��ȡ���.txt
)
pause>nul
exit
rem ��ȡģʽ
:duqu
color 3f
cls & title ��ȡ�ļ�(��ȡģʽ)BY��ȴ������
echo ��ʾ:
echo �ļ������Զ���ȡtxtΪ��׺���ļ���
ping -n 2 127>nul & cls
dir /b|findstr "txt">�ı�.x || goto error
for /f "delims=" %%i in (�ı�.x) do (
  set f=%%i
  )
del �ı�.x
echo ����ɹ� & ping -n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%f%) do (
echo %%i
echo %%i>>��ȡ���.txt
)
start ��ȡ���.txt
exit
:error
del �ı�.x
cls
echo �ı�����ʧ�� & ping -n 2 127>nul & cls
echo �ֶ������ȡ�ļ�(�ɽ��ļ��������)��
set /p h=
echo ����ɹ� & ping -n 2 127>nul & cls
for /f "usebackq delims=" %%i in (%h%) do (
echo %%i
echo %%i>>��ȡ���.txt
)
if not exist ��ȡ���.txt more %h%>>��ȡ���.txt && more %h%
pause>nul
goto :eof


:debug
rem debugģʽ
title �ļ���ȡdebugģʽ
cls & for /f "delims=*" %%i in ("Windows�ļ���ȡdebugģʽ") do (
 set video=%%i
 for /l %%j in (0,1,19) do set /p "=!video:~%%j,1!"<nul & ping /n 1 127>nul
) & ping /n 1 127>nul & cls
choice /c yn /n /m ȫ��ģʽ?(Y/N)
if %errorlevel%==1 mode con lines=500 cols=500
if %errorlevel%==2 goto run
:run
set /p file=�����ļ�:
cls & for /f "delims=" %%i in (%file%) do (
  echo %%i
)
pause>nul
