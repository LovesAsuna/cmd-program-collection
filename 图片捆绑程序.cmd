@echo off & setlocal enabledelayedexpansion & color 0a
title ͼƬ�������By��ȴ������
rem ȷ��ѹ���ļ���׺
:suffix
choice /c zr /n /m "������ѹ���ļ��ĺ�׺(z[zip] or r[rar]):"
if /i "%errorlevel%" equ "1" set d=zip & goto photosuffix
if /i "%errorlevel%" equ "2" set d=rar & goto photosuffix
cls 
ping /n 2 127>nul & cls
goto suffix


rem ȷ��ͼƬ��׺
:photosuffix
choice /c jp /n /m "������ѹ���ļ��ĺ�׺(j[jpg] or p[png]):"
if /i "%errorlevel%" equ "1" set f=jpg & goto repare
if /i "%errorlevel%" equ "2" set f=png & goto repare
cls 
ping /n 2 127>nul & cls
goto photosuffix


:repare
::ͼƬѰ��
dir /b|findstr /i "%f%">ͼƬ����.txt
for /f "delims=" %%i in (ͼƬ����.txt) do (
  set a=%%i
  )
::ѹ���ļ�Ѱ��
dir /b|findstr /i "%d%">ѹ������.txt
for /f "delims=" %%i in (ѹ������.txt) do (
  set b=%%i
  )
 cls
 echo �Ѱ����Զ���Ѱ����� 
 echo ͼƬѰ�ҽ��:%a%
 echo ѹ���ļ�Ѱ�ҽ��:%b%
del ͼƬ����.txt & del ѹ������.txt
rem ����Զ�����
set arepair=%a:~-3%
set brepair=%b:~-3%
if /i %arepair% neq %f% goto input
if /i %brepair% neq %d% goto input
goto run

:input
cls
echo                              �Զ�����ʧ�����ֶ�����
ping/n 2 127>nul & cls
echo �ֶ�����ѹ���ļ���ͼƬ����:
set /p b=ѹ���ļ���
set /p a=ͼƬ��
goto run

:run
echo �밴�����ȷ��ѹ��
pause>nul
cls
set /p c=�������Ƶ�ͼƬ����(������׺):
copy /b %a%+%b% %c%.jpg>nul
for /l %%i in (5,-1,0) do (
  echo ������ɣ����� %%i ���Զ��˳�
  ping -n 2 127.0.0.1>nul
  cls
  )
