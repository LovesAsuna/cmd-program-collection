��a
cls
@echo off
color 0a
title �����ļ�By��ȴ������
echo ���ļ������޸Ŀ�������,�������ڷǷ���;��
echo ͬ��������y,��֮����n
set /p b=��֤:
if "%b%"=="y" goto main
if "%b%"=="n" goto tuichu2

:feifa
cls
echo �������˷Ƿ���֤�ַ�,�����Զ��˳���
ping -n 3 127.0.0.1>nul
goto tuichu
 
:main
cls
echo ���ڽ��е�һ����:������л���
echo Ӧ���оٶ�ʱ��������
ping -n 3 127.0.0.1>nul
net user jiance 123 /add && cls && echo ���������� & cls & net user jiance /del>nul && goto jiance2
goto cuowu

:jiance2
echo ���ڽ��еڶ�����:ɱ��������(���360)
ping -n 3 127.0.0.1>nul
tasklist|findstr "360" && cls && echo ��⵽360ɱ��������� && goto cuowu2
cls
echo ���ڽ������������.. & ping -n 2 127.0.0.1>nul & cls
set /p a=���ڴ���������Ҫ�����ɵĿ�������:
net user %username% %a%
cls
echo �����ĺ������:%a%
echo ���μ�
pause>nul
exit


:cuowu
cls
echo Ӧ�û��������ɣ�Ӧ���޷�����ִ�У�
ping -n 3 127.0.0.1>nul
goto tuichu

:cuowu2
echo �����޷���ȷ����
echo �Ƽ����� & ping -n 1 127.0.0.1>nul
echo �ر�360ɱ�������������ʱ�������:
ping -n 3 127.0.0.1>nul
goto tuichu

:tuichu
cls
for /l %%i in (3,-1,0) do (
 echo ���� %%i �����Զ��˳�
 ping -n 2 127.0.0.1>nul
 cls
)
exit

:tuichu2
cls
echo �������������ʹ�ô˳���
ping -n 3 127.0.0.1>nul
goto tuichu
