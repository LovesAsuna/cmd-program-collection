��a
cls
��a
cls
@echo off & setlocal enabledelayedexpansion & call :temp
title ����ת�Ǻ�
::���������
call :values
:pswmain 
rem ��Ҫ�ı����ض���
set save=
for /f "usebackq delims=" %%i in (`xcopy /w . 2^>nul`) do (
if not defined save set save=%%i
)
set save=%save:~-1%
set password=!password!!save!
if not defined save goto finish
set /a typetimes=%typetimes%+1
if %typetimes%==17 echo. & echo                           ���������ѳ����޶����������� && ping /n 2 127>nul & cls & goto All
::�Ǻ�ת������
for /f "delims=" %%i in (%temp%\psw\%typetimes%.psw) do (
    set star=%%i
)
cls
echo                                �����16λ��������
echo ==============================================================================
echo                            ����:%star% (%typetimes%)                
echo ==============================================================================
goto pswmain
:finish
for /f "delims=+" %%i in (key.txt) do (
set default=%%i
)
if "%password%"=="%default%" goto menu
echo Your password is wrong!This windows will be closed!
rd %temp%\psw /s/q 2>nul
for /l %%i in (5,-1,0) do (
echo ʣ�� %%i ���Զ��˳���
ping /n 2 127>nul
cls
)
exit

:menu
echo ������ȷ
goto eof








:temp
md %temp%\psw\ 2>nul
echo *>%temp%\psw\1.psw
echo **>%temp%\psw\2.psw
echo ***>%temp%\psw\3.psw
echo ****>%temp%\psw\4.psw
echo *****>%temp%\psw\5.psw
echo ******>%temp%\psw\6.psw
echo *******>%temp%\psw\7.psw
echo ********>%temp%\psw\8.psw
echo *********>%temp%\psw\9.psw
echo **********>%temp%\psw\10.psw
echo ***********>%temp%\psw\11.psw
echo ************>%temp%\psw\12.psw
echo *************>%temp%\psw\13.psw
echo **************>%temp%\psw\14.psw
echo ***************>%temp%\psw\15.psw
echo ****************>%temp%\psw\16.psw

::����
:values
set password=
set save=
set typetimes=0
::rem �ֽ���====================