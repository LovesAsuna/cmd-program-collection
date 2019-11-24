@ECHO off & title 英语复习
SETLOCAL ENABLEDELAYEDEXPANSION 
set /a oder_control=-1
set /p unit=请输入单元数：

if !unit!==1 (
set /p iE=请输入小节数：
::Unit1_iexpore1
if !iE!==1 (
set /a skip_=0
set /a qu_jian=34 
)
::Unit1_iexpore2
if !iE!==2 (
set /a skip_=34
set /a qu_jian=13
)
)


 
if !unit!==2 (

set /p iE=请输入小节数：
if !iE!==1 (
set /p part=此小节分为两部分，请输入部分数：
title 英语复习: 第!unit!单元!iE!小节第!part!部分
::Unit2_iexpore1_part1
if !part!==1 (
set /a skip_=47
set /a qu_jian=36
)
::Unit2_iexpore1_part2
if !part!==2 (
set /a skip_=83
set /a qu_jian=22
)
)


if !iE!==2 (
set /p part=此小节分为两部分，请输入部分数：
title 英语复习: 第!unit!单元!iE!小节第!part!部分
::Unit2_iexpore2_part1
if !part!==1 (
set /a skip_=105
set /a qu_jian=24
)
::Unit2_iexpore2_part2
if !part!==2 (
set /a skip_=129
set /a qu_jian=24
)
)
)



::存入英文数据
if !skip_!==0 (
set /a h=-1
FOR /F "tokens=1" %%i IN (UniversityEnglish.txt) DO (
SET /A h+=1 & SET rEnglish!h!=%%i
) 
) else (
set /a h=-1
FOR /F "skip=%skip_% tokens=1" %%i IN (UniversityEnglish.txt) DO (
SET /A h+=1 & SET rEnglish!h!=%%i
)
)


::存入中文数据
if !skip_!==0 (
set /a j=-1
FOR /F "tokens=2" %%i IN (UniversityEnglish.txt) DO (
SET /A j+=1 & SET rChinese!j!=%%i
)
) else (
set /a j=-1
FOR /F "skip=%skip_% tokens=2" %%i IN (UniversityEnglish.txt) DO (
SET /A j+=1 & SET rChinese!j!=%%i
) 
)

set /p type_translate="英文-->中文：1，中文-->英文：2，请输入:"
set /p oder_or_random="随机出现单词：1，依次出现单词：2，请输入："
if !type_translate!==1 (
if !oder_or_random!==1 (
goto English_C_random
)
if !oder_or_random!==2 (
goto English_C_oder
) 
)


if !type_translate!==2 (

if !oder_or_random!==1 (
goto Chinese_E_random
)
if !oder_or_random!==2 (
goto Chinese_E_oder
) 
)

::主体
:English_C_random
cls & set input=
set /a ran_dom=%random% "%%" !qu_jian!
echo !rEnglish%ran_dom%!
set /p input=请输入中文: 

if "!input"!=="0" goto English_C_random
if !input!==!rChinese%ran_dom%! (
echo 答案正确
echo.
ping /n 2 127>nul
) else (
echo 正确答案为: !rChinese%ran_dom%!
ping /n 4 127>nul
echo.)
goto English_C_random


:English_C_oder
cls & set input=
set /a qu_jian1=!qu_jian!-1
if !oder_control!==!qu_jian1! (
set /a oder_control=-1
)
set /a oder_control+=1 
echo !rEnglish%oder_control%!

set /p input=请输入中文: 
if "!input!"=="0" goto English_C_oder
if !input!==!rChinese%oder_control%! (
echo 答案正确
echo.
ping /n 2 127>nul
) else (
echo 正确答案为: !rChinese%oder_control%!
ping /n 4 127>nul
echo.)
goto English_C_oder


:Chinese_E_random
cls & set input=
set /a ran_dom=%random% "%%" !qu_jian!
echo !rChinese%ran_dom%!
set /p input=请输入英文: 

if "!input!"=="0" goto Chinese_E_random
if !input!==!rEnglish%ran_dom%! (
echo 答案正确
echo.
ping /n 2 127>nul
) else (
echo 正确答案为: !rEnglish%ran_dom%!
ping /n 4 127>nul
echo.)
goto Chinese_E_random


:Chinese_E_oder
cls & set input=
set /a qu_jian1=!qu_jian!-1
if !oder_control!==!qu_jian1! (
set /a oder_control=-1
)
set /a oder_control+=1 
echo !rChinese%oder_control%!
set /p input=请输入英文: 

if "!input!"=="0" goto Chinese_E_oder
if !input!==!rEnglish%oder_control%! (
echo 答案正确
echo.
ping /n 2 127>nul
) else (
echo 正确答案为: !rEnglish%oder_control%!
ping /n 4 127>nul
echo.)
goto Chinese_E_oder
pause