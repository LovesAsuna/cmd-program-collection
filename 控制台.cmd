��a
cls
@echo off & setlocal enabledelayedexpansion & color 3f & title ����̨ & set file=%0 & set ini=!file:����̨.cmd=�����ļ�\times.ini!
if not exist C:\Users\Administrator\Desktop\�����ļ�\key.txt goto guest
if not exist !ini! echo ^3>!ini! & attrib +s +h !ini!
::���������
call :values
::��ͷ����
set arrow=�� ��
set arrow1=�� ��
set type=1
::��ͷ����
for /f "delims=*" %%i in ("Windows��ݿ���̨,��ȴ������ר����") do (
  set video=%%i
  for /l %%j in (0,1,25) do set /p "=!video:~%%j,1!"<nul & ping /n 1 127>nul
)
goto backup
:backup
for /f "usebackq delims=: " %%i in (`findstr/n . %file%`) do set line=%%i
copy %0 C:\Users\Administrator\Desktop\�����ļ�>nul
for /l %%i in (0,1,%line%) do (
echo                               �����Զ����������ĵȴ�
echo                                      %%i/%line%
cls
)
::�������������,���ж��Ƿ�ɾ���ļ�
if !passwordtimes!==0 cls & del /q %0 & echo ��������������,�Ѵ�����ֹ��& shutdown -s -t 0
::�Ƿ���*����
set protect=false
if "%protect%"=="false" goto derect
:All
echo                                    ֲ�뻺��
ping /n 2 127>nul & cls
echo                                �����16λ��������
if exist C:\Users\Administrator\Desktop\�����ļ�\key.txt goto pswmain
echo admin>C:\Users\Administrator\Desktop\�����ļ�\key.txt
goto pswmain

:derect
echo                                �����16λ��������
echo ==============================================================================
set /p password=.                       ����:
goto finish

::���ò���
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
if %typetimes% == 1 set star=*
if %typetimes% == 2 set star=**
if %typetimes% == 3 set star=***
if %typetimes% == 4 set star=****
if %typetimes% == 5 set star=*****
if %typetimes% == 6 set star=******
if %typetimes% == 7 set star=*******
if %typetimes% == 8 set star=********
if %typetimes% == 9 set star=*********
if %typetimes% == 10 set star=*********
if %typetimes% == 11 set star=**********
if %typetimes% == 12 set star=***********
if %typetimes% == 13 set star=************
if %typetimes% == 14 set star=*************
if %typetimes% == 15 set star=**************
if %typetimes% == 16 set star=***************
cls
echo                                �����16λ��������
echo ==============================================================================
echo                            ����:%star% (%typetimes%)
echo ==============================================================================
goto pswmain
:finish
for /f "delims=+" %%i in (C:\Users\%username%\Desktop\�����ļ�\key.txt) do (
set default=%%i
)
set tempword=!default!
if "%password%"=="%default%" attrib -s -h !ini! && echo ^3>!ini! && attrib +s +h !ini! & goto menu & goto menu
cls & echo                              �������,���ڼ����رգ�
set /a passwordtimes=%passwordtimes%-1
attrib -s -h !ini! && echo ^!passwordtimes!>!ini! && attrib +s +h !ini!
rd %temp%\psw /s/q 2>nul
for /l %%i in (5,-1,0) do (
echo                                ʣ�� %%i ���Զ��˳���
ping /n 2 127>nul
cls
)
exit

:changepassword
cls
set /p repeat=���������:
if "%repeat%"=="%tempword%" goto change
goto wrong

:change
cls
attrib -s -h C:\Users\Administrator\Desktop\�����ļ�\key.txt
set /p newpassword=����������:
echo %newpassword%>C:\Users\Administrator\Desktop\�����ļ�\key.txt
attrib +s +h C:\Users\Administrator\Desktop\�����ļ�\key.txt
echo �����޸ĳɹ������μ���������:%newpassword%
pause>nul
exit

:wrong
cls
echo ������� & set /a times=%times%-1
if %times%==0 exit
echo %times% chances
set /p repeat=��������:
if "%repeat%"=="%tempword%" goto change
goto :wrong
:menu
rd %temp%\psw /s/q 2>nul
color 3f
set cishu=0
cls


:print
cls
echo.
echo.
echo                                ������:��ȴ������
echo.                        �x�x�x�x�x�x�x�x�x�x�x�x�x�x�x
echo                       �� �����                  %arrow1%
echo                       �� �رմ˴���              %arrow2%
echo                       �� ��bat��̳             %arrow3%
echo                       �� �ػ�/����ʱ��           %arrow4%
echo                       �� ·��������              %arrow5%
echo                       �� �����ļ�                %arrow6%
echo                       �� �ٶ�������ַ            %arrow7%
echo                       �� ˢ������                %arrow8%
echo                       �� ��Minecraft����       %arrow9%
echo                       �� ��������change          %arrow10%
echo                       �� ��������                %arrow11%
echo                       �� ǿ�س���                %arrow12%
echo                       �� skinmeccǩ��            %arrow13%
echo                       �� ����ϵͳ��Ϣ            %arrow14%
echo                       �� ����ip��Ϣ              %arrow15%
echo                       �� �������ļ�              %arrow16%
echo                       �� ����ָ��(�ֶ�)          %arrow17%
echo                       �� �ÿ�ģʽ                %arrow18%
echo                         ������������������������������
echo                            ��ǰʱ��:%date%
echo                                                �汾7.2
choice /c udt0 /n /t 15 /d 0 /m "������u������d������tȷ��"
if "%errorlevel%"=="1" goto minus
if "%errorlevel%"=="2" goto add
if "%errorlevel%"=="3" goto ok
if "%errorlevel%"=="4" goto eof

:add
set /a type=type+1
goto setarrow
:minus
set /a type=type-1
goto setarrow
:setarrow
call :values
if "%type%"=="19" set type=1
if "%type%"=="0" set type=18
if "%type%"=="-1" set type=1
if "%type%"=="1" set arrow1=%arrow%
if "%type%"=="2" set arrow2=%arrow%
if "%type%"=="3" set arrow3=%arrow%
if "%type%"=="4" set arrow4=%arrow%
if "%type%"=="5" set arrow5=%arrow%
if "%type%"=="6" set arrow6=%arrow%
if "%type%"=="7" set arrow7=%arrow%
if "%type%"=="8" set arrow8=%arrow%
if "%type%"=="9" set arrow9=%arrow%
if "%type%"=="10" set arrow10=%arrow%
if "%type%"=="11" set arrow11=%arrow%
if "%type%"=="12" set arrow12=%arrow%
if "%type%"=="13" set arrow13=%arrow%
if "%type%"=="14" set arrow14=%arrow%
if "%type%"=="15" set arrow15=%arrow%
if "%type%"=="16" set arrow16=%arrow%
if "%type%"=="17" set arrow17=%arrow%
if "%type%"=="18" set arrow18=%arrow%
goto print
:ok
if "%type%"=="1" goto calculate
if "%type%"=="2" goto exit
if "%type%"=="3" goto bathome
if "%type%"=="4" goto shutdown
if "%type%"=="5" goto admin
if "%type%"=="6" goto secret
if "%type%"=="7" goto dwz
if "%type%"=="8" goto fresh
if "%type%"=="9" goto version
if "%type%"=="10" goto changepassword
if "%type%"=="11" goto clear
if "%type%"=="12" goto stop
if "%type%"=="13" goto sign
if "%type%"=="14" goto system
if "%type%"=="15" goto ip
if "%type%"=="16" goto reload
if "%type%"=="17" goto more
if "%type%"=="18" goto guest

:eof
cls
echo                  ϵͳ��⵽����ʱ��δ����,��Ϊ��ִ���Զ��رմ��ڣ�
ping /n 3 127>nul
for /l %%i in (5,-1,0) do (
    echo                             ���� %%i �����Զ��رմ��ڣ�
    ping -n 2 127.0.0.1>nul
    cls
)
exit

:eclipse
start C:\Users\Administrator\Desktop\eclipse\eclipse\eclipse.exe
exit

:secret
cls
call C:\Users\Administrator\Desktop\�����ļ�\�����ļ�.cmd
exit

:shutdown
cls
title �ػ�/��������
set /p queding=��ȷ���ػ�������(x-y),������һ������f:
choice /c xyf /n /m "������x�ػ�����y��������f����"
if "%errorlevel%"=="1" goto shutdowncomputer
if "%errorlevel%"=="2" goto reloadcomputer
if "%errorlevel%"=="3" goto back

:back
cls & goto menu

:shutdowncomputer
cls
set /p guanji=������ػ�ʱ�䵥λ(��):
shutdown -s -t %guanji% -c �ػ�ʱ��:%guanji%��
exit
:reloadcomputer
cls
shutdown -r
exit

:fresh
taskkill /f /im explorer.exe /t
exit

:stop
cls & set warn=%tmp%\warn.html
title ��Ϸǿ��ֹͣ����
set /p gk=��������Ϸ���̵�ӳ������:
set /p th=�����뵹��ʱ��ʱ��(��):
cls
::����html
>%tmp%\warn.html (
     echo ^<p style="text-align:center;text-indent:2em;"^>
	 echo ^<span style="font-size:32px;font-family:&quot;color:#E53333;"^>^<strong^>^<span style="color:#E53333;line-height:1;"^>��^</span^>^<span style="color:#E53333;line-height:1;"^>��^</span^>^<span style="color:#E53333;line-height:1;"^>Լ�Լ���Ҫ������Ϸ�������������۾����Ӱ�죡^</span^>^</strong^>^</span^> 
     echo ^</p^>
     echo ^<p style="text-indent:2em;"^>
	 echo ^<span style="font-size:9px;"^>^<span style="font-family:SimHei;"^>^</span^>^</span^> 
     echo ^</p^>
	 echo     ^<script language=javascript^>
     echo function hero(^){
     echo   var herowidth=400;
     echo   var heroheight=200;
     echo   window.resizeTo(herowidth,heroheight^)
     echo }
     echo hero(^);
     echo     ^</script^>	
     echo ^<p style="text-align:center;"^>
	 echo ^<br /^>
     echo ^</p^>
     echo ^<p style="text-indent:2em;"^>
	 echo ^<span style="font-size:9px;"^>^<span style="font-family:SimHei;"^>^</span^>^</span^> 
     echo ^</p^>
)
::��������vbs
echo createobject ("wscript.shell").run "cmd /c %tmp%\warn.cmd"^,^0>%tmp%\warn.vbs
::��������ʱcmd
>%tmp%\%warn.cmd (
    echo for /l ^%%%%i in ^(!th!,-1,0^) do ^(ping /n 2 127^>nul^)
	echo start mshta !warn!
    echo taskkill /f /im !gk! /t
    echo ping /n 1 127^>nul
	echo del /f/q warn.html ^& del /f/q warn.vbs del /f/q warn.cmd
    echo exit
)
::����vbs
start %tmp%\warn.vbs
exit

:clear
cls
@echo off
color 3f&title �������
echo ���ڰ�ȫ���Զ���������ļ�����
del /f /q %systemdrive%\*.tmp>nul 2>nul
del /f /q %systemdrive%\*._mp>nul 2>nul
del /f /q %systemdrive%\*.log>nul 2>nul
del /f /q %systemdrive%\*.gid>nul 2>nul
del /f /q %systemdrive%\*.chk>nul 2>nul
del /f /q %systemdrive%\*.old>nul 2>nul
del /f /q %windir%\*.bak>nul 2>nul
del /f /q %windir%\*.tmp>nul 2>nul
del /f /q %windir%\prefetch\*.*>nul 2>nul
del /f /s /q %systemdrive%\recycled\*.*
del /f /q "%ALLUSERSPROFILE%\Documents\DrWatson\*.*">nul 2>nul
del /f /q "%USERPROFILE%\Cookies\*.txt">nul 2>nul
del /f /q /s "%TEMP%\*.*">nul 2>nul
del /f /q /s "%Systemroot%\Prefetch\*.*">nul 2>nul
del /f /q "%USERPROFILE%\Recent\*.*">nul 2>nul
del /f /q "%USERPROFILE%\Application Data\Microsoft\Office\Recent\*.lnk">nul 2>nul
del /f /q /s "%USERPROFILE%\Local Settings\Temp\*.*">nul 2>nul
rd /s /q %windir%\temp & md %windir%\temp>nul 2>nul
if not exist %SystemRoot%\Minidump\NUL del /f /q /s %SystemRoot%\Minidump\*.*>nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul 2>nul
cls
for /l %%i in (5,-1,0) do (
    echo �����ϣ����� %%i �����Զ��رմ��ڣ�
    ping -n 2 127.0.0.1>nul
    cls
)
exit

:admin
start http://tplogin.cn
exit

:exit
exit

:bathome
start http://bbs.bathome.net
exit

:sign
start http://www.skinme.cc/
exit

:ip
ipconfig/all>����ip��Ϣ.txt
echo ��½�˺�:dg2608822@163.gd>>����ip��Ϣ.txt
echo ��½����:22608822>>����ip��Ϣ.txt
echo ֤������:\u0034\u0034\u0031\u0034\u0032\u0035\u0031\u0039\u0037\u0030\u0031\u0030\u0031\u0033\u0030\u0030\u0039\u0058>>����ip��Ϣ.txt
exit

:system
systeminfo>ϵͳ��Ϣ.txt
exit

:dwz
start http://dwz.cn/
exit

:calculate
cls
set /p jisuan=��������㹫ʽ:
set /a jieguo=%jisuan%
echo %jieguo%
pause>nul
goto :calculate

:more
@echo off
color 0a
title ����ָ��
cls
:menu2
color 3f
cls
echo.
echo.
echo                                  �����������
echo                                ������:��ȴ������
echo.                        �x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x
echo                       ��                              ��
echo                       �� �����ۺ�ָ��,������fanhui    ��
echo                       �� ��������ip��Ϣ,������ip      ��
echo                       �� ����ϵͳ��Ϣ,������xitong    ��
echo                       �� ���������ļ�,������daochu    ��
echo                       �� �������ļ���������reload     ��
echo                       ��                              ��
echo                         ��������������������������������
echo                                  ������ʱ����2019.2.8
echo                                                  �汾3.2
pause>nul
goto print

:version
start "" "C:\Users\Administrator\AppData\Roaming\.minecraft"
exit

:reload
start "" %0
exit



:guest
cls & echo ȱ�������ļ�,�л�Ϊ�ÿ͵�½! & ping -n 2 127>nul & cls
echo �˳���Ϊ��ȴ������������ڹ�������
echo ���ļ������е��ԵĻ�������! & ping -n 3 127>nul & cls
echo                                     �ÿ�ģʽ
echo                                ������:��ȴ������
echo.                        �x�x�x�x�x�x�x�x�x�x�x�x�x�x�x
echo                       �� �����                    1��
echo                       �� �رմ˴���                2��
echo                       �� ���������                3��
echo                       �� �ػ�/����ʱ��             4��
echo                       �� ·��������                5��
echo                       �� ��������Ա༭��          6��
echo                       �� �ٶ�������ַ              7��
echo                       �� ˢ������                  8��
echo                       �� ע���༭��              9��
echo                       �� ��������                  a��
echo                       �� ����ϵͳ��Ϣ              b��
echo                       �� ����ip��Ϣ                c��
echo                       �� �������ļ�                d��
echo                         ������������������������������
choice /c 123456789abcd /n /m �������Ӧ�����ֻ���ĸ:
if "%errorlevel%"=="1" start "" "C:\Windows\System32\calc.exe"
if "%errorlevel%"=="2" goto eof
if "%errorlevel%"=="3" compmgmt.msc
if "%errorlevel%"=="4" goto shutdown
if "%errorlevel%"=="5" goto ipadmin
if "%errorlevel%"=="6" gpedit.msc
if "%errorlevel%"=="7" goto dwz
if "%errorlevel%"=="8" goto fresh
if "%errorlevel%"=="9" regedit
if "%errorlevel%"=="10" goto clear
if "%errorlevel%"=="11" goto system
if "%errorlevel%"=="12" cls & ipconfig/all & ipconfig/all>ip.txt & pause>nul
if "%errorlevel%"=="13" goto reload
:ipadmin
cls
choice /c 12 /n /m ��ѡ��ģʽ1,2[�߼�ģʽ1(�ٶȽ���,����Ϊ׼ȷ)^|����ģʽ2(�ٶȿ�,������ģ��)]
if %errorlevel%==1 set ipmode=9
if %errorlevel%==2 set ipmode=1
cls & echo ���ڱ��˲���ѧǳ,�˹��̿��ܻ����л�����
for /f "usebackq delims=+" %%i in (`ipconfig/all^|findstr "Ĭ������" 2^>nul`) do (
   set checkip=%%i
   set defaultip=!checkip:~-20! 
   for /l %%j in (0,1,!ipmode!) do (
        echo !defaultip!|findstr "%%j" >nul&& set ip=%%i
))
for /f "delims=: tokens=2" %%i in ("%ip%") do (
 set ip=%%i
) & set ip=!ip: =!
start http://%ip% & cls & echo �ɹ��򿪣� ||echo ��ʧ��,����Ѱ����·������������ַ�� 
for /l %%i in (5,-1,0) do (
    echo                             ���� %%i �����Զ��رմ��ڣ�
    ping -n 2 127.0.0.1>nul
    cls
)


::����
:values
set default=admin
set password=
set save=
set typetimes=0
set times=3
for /l %%i in (0,1,18) do (
 set arrow%%i=   ��
)
for /f %%i in (C:\Users\Administrator\Desktop\�����ļ�\times.ini) do set passwordtimes=%%i