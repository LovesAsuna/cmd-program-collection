@echo off
color 0a
title 绝密文件By忘却的旋律
echo 此文件用于修改开机秘密,请勿用于非法用途！
echo 同意请输入y,反之输入n
set /p b=认证:
if "%b%"=="y" goto main
if "%b%"=="n" goto tuichu2

:feifa
cls
echo 您输入了非法验证字符,程序自动退出！
ping -n 3 127.0.0.1>nul
goto tuichu
 
:main
cls
echo 正在进行第一步骤:检测运行环境
echo 应用有举动时请点击允许
ping -n 3 127.0.0.1>nul
net user jiance 123 /add && cls && echo 环境检测完成 & cls & net user jiance /del>nul && goto jiance2
goto cuowu

:jiance2
echo 正在进行第二步骤:杀毒软件检测(针对360)
ping -n 3 127.0.0.1>nul
tasklist|findstr "360" && cls && echo 检测到360杀毒软件存在 && goto cuowu2
cls
echo 正在进入程序主界面.. & ping -n 2 127.0.0.1>nul & cls
set /p a=请在此输入您需要更换成的开机密码:
net user %username% %a%
cls
echo 您更改后的密码:%a%
echo 请牢记
pause>nul
exit


:cuowu
cls
echo 应用环境检测完成，应用无法正常执行！
ping -n 3 127.0.0.1>nul
goto tuichu

:cuowu2
echo 可能无法正确运行
echo 推荐方法 & ping -n 1 127.0.0.1>nul
echo 关闭360杀毒软件或在拦截时点击允许:
ping -n 3 127.0.0.1>nul
goto tuichu

:tuichu
cls
for /l %%i in (3,-1,0) do (
 echo 将在 %%i 秒内自动退出
 ping -n 2 127.0.0.1>nul
 cls
)
exit

:tuichu2
cls
echo 请您考虑清楚再使用此程序！
ping -n 3 127.0.0.1>nul
goto tuichu
