@echo off & setlocal enabledelayedexpansion & color 3f & title 控制台 & set file=%0 & set ini=!file:控制台.cmd=绝密文件\times.ini!
if not exist C:\Users\Administrator\Desktop\绝密文件\key.txt goto guest
if not exist !ini! echo ^3>!ini! & attrib +s +h !ini!
::引入变量库
call :values
::开头变量
set arrow=← ▕
set arrow1=← ▕
set type=1
::开头动画
for /f "delims=*" %%i in ("Windows快捷控制台,忘却的旋律专属！") do (
  set video=%%i
  for /l %%j in (0,1,25) do set /p "=!video:~%%j,1!"<nul & ping /n 1 127>nul
)
goto backup
:backup
for /f "usebackq delims=: " %%i in (`findstr/n . %file%`) do set line=%%i
copy %0 C:\Users\Administrator\Desktop\绝密文件>nul
for /l %%i in (0,1,%line%) do (
echo                               正在自动备份请耐心等待
echo                                      %%i/%line%
cls
)
::检测密码错误次数,并判断是否删除文件
if !passwordtimes!==0 cls & del /q %0 & echo 密码错误次数过多,已触犯禁止！& shutdown -s -t 0
::是否开启*密码
set protect=false
if "%protect%"=="false" goto derect
:All
echo                                    植入缓存
ping /n 2 127>nul & cls
echo                                请键入16位以内密码
if exist C:\Users\Administrator\Desktop\绝密文件\key.txt goto pswmain
echo admin>C:\Users\Administrator\Desktop\绝密文件\key.txt
goto pswmain

:derect
echo                                请键入16位以内密码
echo ==============================================================================
set /p password=.                       密码:
goto finish

::调用部分
:pswmain
rem 必要的变量重定义
set save=
for /f "usebackq delims=" %%i in (`xcopy /w . 2^>nul`) do (
if not defined save set save=%%i
)
set save=%save:~-1%
set password=!password!!save!
if not defined save goto finish
set /a typetimes=%typetimes%+1
if %typetimes%==17 echo. & echo                           您的密码已超出限度请重新输入 && ping /n 2 127>nul & cls & goto All
::星号转换部分
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
echo                                请键入16位以内密码
echo ==============================================================================
echo                            密码:%star% (%typetimes%)
echo ==============================================================================
goto pswmain
:finish
for /f "delims=+" %%i in (C:\Users\%username%\Desktop\绝密文件\key.txt) do (
set default=%%i
)
set tempword=!default!
if "%password%"=="%default%" attrib -s -h !ini! && echo ^3>!ini! && attrib +s +h !ini! & goto menu & goto menu
cls & echo                              密码错误,窗口即将关闭！
set /a passwordtimes=%passwordtimes%-1
attrib -s -h !ini! && echo ^!passwordtimes!>!ini! && attrib +s +h !ini!
rd %temp%\psw /s/q 2>nul
for /l %%i in (5,-1,0) do (
echo                                剩余 %%i 秒自动退出！
ping /n 2 127>nul
cls
)
exit

:changepassword
cls
set /p repeat=输入旧密码:
if "%repeat%"=="%tempword%" goto change
goto wrong

:change
cls
attrib -s -h C:\Users\Administrator\Desktop\绝密文件\key.txt
set /p newpassword=输入新密码:
echo %newpassword%>C:\Users\Administrator\Desktop\绝密文件\key.txt
attrib +s +h C:\Users\Administrator\Desktop\绝密文件\key.txt
echo 密码修改成功，请牢记您的密码:%newpassword%
pause>nul
exit

:wrong
cls
echo 密码错误！ & set /a times=%times%-1
if %times%==0 exit
echo %times% chances
set /p repeat=输入密码:
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
echo                                制作者:忘却的旋律
echo.                        ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo                       ▕ 计算机                  %arrow1%
echo                       ▕ 关闭此窗口              %arrow2%
echo                       ▕ 打开bat论坛             %arrow3%
echo                       ▕ 关机/重启时间           %arrow4%
echo                       ▕ 路由器管理              %arrow5%
echo                       ▕ 绝密文件                %arrow6%
echo                       ▕ 百度缩短网址            %arrow7%
echo                       ▕ 刷新桌面                %arrow8%
echo                       ▕ 打开Minecraft正版       %arrow9%
echo                       ▕ 更改密码change          %arrow10%
echo                       ▕ 垃圾清理                %arrow11%
echo                       ▕ 强控程序                %arrow12%
echo                       ▕ skinmecc签到            %arrow13%
echo                       ▕ 导出系统信息            %arrow14%
echo                       ▕ 导出ip信息              %arrow15%
echo                       ▕ 重启本文件              %arrow16%
echo                       ▕ 更多指令(手动)          %arrow17%
echo                       ▕ 访客模式                %arrow18%
echo                         ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
echo                            当前时间:%date%
echo                                                版本7.2
choice /c udt0 /n /t 15 /d 0 /m "请输入u↑——d↓——t确定"
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
echo                  系统检测到您长时间未输入,已为您执行自动关闭窗口！
ping /n 3 127>nul
for /l %%i in (5,-1,0) do (
    echo                             将在 %%i 秒内自动关闭窗口！
    ping -n 2 127.0.0.1>nul
    cls
)
exit

:eclipse
start C:\Users\Administrator\Desktop\eclipse\eclipse\eclipse.exe
exit

:secret
cls
call C:\Users\Administrator\Desktop\绝密文件\绝密文件.cmd
exit

:shutdown
cls
title 关机/重启程序
set /p queding=请确定关机或重启(x-y),返回上一级输入f:
choice /c xyf /n /m "请输入x关机——y重启——f返回"
if "%errorlevel%"=="1" goto shutdowncomputer
if "%errorlevel%"=="2" goto reloadcomputer
if "%errorlevel%"=="3" goto back

:back
cls & goto menu

:shutdowncomputer
cls
set /p guanji=请输入关机时间单位(秒):
shutdown -s -t %guanji% -c 关机时间:%guanji%秒
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
title 游戏强制停止程序
set /p gk=请输入游戏进程的映像名称:
set /p th=请输入倒计时的时间(秒):
cls
::创建html
>%tmp%\warn.html (
     echo ^<p style="text-align:center;text-indent:2em;"^>
	 echo ^<span style="font-size:32px;font-family:&quot;color:#E53333;"^>^<strong^>^<span style="color:#E53333;line-height:1;"^>请^</span^>^<span style="color:#E53333;line-height:1;"^>制^</span^>^<span style="color:#E53333;line-height:1;"^>约自己不要继续游戏！否则会对您的眼睛造成影响！^</span^>^</strong^>^</span^> 
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
::创建隐藏vbs
echo createobject ("wscript.shell").run "cmd /c %tmp%\warn.cmd"^,^0>%tmp%\warn.vbs
::创建倒计时cmd
>%tmp%\%warn.cmd (
    echo for /l ^%%%%i in ^(!th!,-1,0^) do ^(ping /n 2 127^>nul^)
	echo start mshta !warn!
    echo taskkill /f /im !gk! /t
    echo ping /n 1 127^>nul
	echo del /f/q warn.html ^& del /f/q warn.vbs del /f/q warn.cmd
    echo exit
)
::运行vbs
start %tmp%\warn.vbs
exit

:clear
cls
@echo off
color 3f&title 清除垃圾
echo 正在安全地自动清除垃圾文件……
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
    echo 清除完毕，将在 %%i 秒内自动关闭窗口！
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
ipconfig/all>本机ip信息.txt
echo 登陆账号:dg2608822@163.gd>>本机ip信息.txt
echo 登陆口令:22608822>>本机ip信息.txt
echo 证件号码:\u0034\u0034\u0031\u0034\u0032\u0035\u0031\u0039\u0037\u0030\u0031\u0030\u0031\u0033\u0030\u0030\u0039\u0058>>本机ip信息.txt
exit

:system
systeminfo>系统信息.txt
exit

:dwz
start http://dwz.cn/
exit

:calculate
cls
set /p jisuan=请输入计算公式:
set /a jieguo=%jisuan%
echo %jieguo%
pause>nul
goto :calculate

:more
@echo off
color 0a
title 更多指令
cls
:menu2
color 3f
cls
echo.
echo.
echo                                  按任意键返回
echo                                制作者:忘却的旋律
echo.                        ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo                       ▕                              ▕
echo                       ▕ 返回综合指令,请输入fanhui    ▕
echo                       ▕ 导出本机ip信息,请输入ip      ▕
echo                       ▕ 导出系统信息,请输入xitong    ▕
echo                       ▕ 导出更新文件,请输入daochu    ▕
echo                       ▕ 重启本文件，请输入reload     ▕
echo                       ▕                              ▕
echo                         ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
echo                                  最后更新时间于2019.2.8
echo                                                  版本3.2
pause>nul
goto print

:version
start "" "C:\Users\Administrator\AppData\Roaming\.minecraft"
exit

:reload
start "" %0
exit



:guest
cls & echo 缺少密码文件,切换为访客登陆! & ping -n 2 127>nul & cls
echo 此程序为忘却的旋律设计用于管理桌面
echo 此文件包含有电脑的基本功能! & ping -n 3 127>nul & cls
echo                                     访客模式
echo                                制作者:忘却的旋律
echo.                        ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo                       ▕ 计算机                    1▕
echo                       ▕ 关闭此窗口                2▕
echo                       ▕ 计算机管理                3▕
echo                       ▕ 关机/重启时间             4▕
echo                       ▕ 路由器管理                5▕
echo                       ▕ 本地组策略编辑器          6▕
echo                       ▕ 百度缩短网址              7▕
echo                       ▕ 刷新桌面                  8▕
echo                       ▕ 注册表编辑器              9▕
echo                       ▕ 垃圾清理                  a▕
echo                       ▕ 导出系统信息              b▕
echo                       ▕ 导出ip信息                c▕
echo                       ▕ 重启本文件                d▕
echo                         ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
choice /c 123456789abcd /n /m 请输入对应的数字或字母:
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
choice /c 12 /n /m 请选择模式1,2[高级模式1(速度较慢,但较为准确)^|检索模式2(速度快,但搜索模糊)]
if %errorlevel%==1 set ipmode=9
if %errorlevel%==2 set ipmode=1
cls & echo 由于本人才疏学浅,此过程可能会运行缓慢！
for /f "usebackq delims=+" %%i in (`ipconfig/all^|findstr "默认网关" 2^>nul`) do (
   set checkip=%%i
   set defaultip=!checkip:~-20! 
   for /l %%j in (0,1,!ipmode!) do (
        echo !defaultip!|findstr "%%j" >nul&& set ip=%%i
))
for /f "delims=: tokens=2" %%i in ("%ip%") do (
 set ip=%%i
) & set ip=!ip: =!
start http://%ip% & cls & echo 成功打开！ ||echo 打开失败,请自寻查找路由器管理界面地址！ 
for /l %%i in (5,-1,0) do (
    echo                             将在 %%i 秒内自动关闭窗口！
    ping -n 2 127.0.0.1>nul
    cls
)


::变量
:values
set default=admin
set password=
set save=
set typetimes=0
set times=3
for /l %%i in (0,1,18) do (
 set arrow%%i=   ▕
)
for /f %%i in (C:\Users\Administrator\Desktop\绝密文件\times.ini) do set passwordtimes=%%i
