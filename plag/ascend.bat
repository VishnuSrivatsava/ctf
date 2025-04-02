@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

setlocal
set "file=C:\Windows\System32\Drivers\etc\hosts"
(
    echo 127.0.0.1 www.pastebin.com
    echo 127.0.0.1 pastebin.com
    echo 127.0.0.1 www.codechef.com
    echo 127.0.0.1 codechef.com
    echo 127.0.0.1 www.geeksforgeeks.org
    echo 127.0.0.1 geeksforgeeks.org
    echo 127.0.0.1 leetcode.com
    echo 127.0.0.1 www.leetcode.com
    echo 127.0.0.1 topcoder.com
    echo 127.0.0.1 www.topcoder.com
    echo 127.0.0.1 atcoder.jp
    echo 127.0.0.1 www.atcoder.jp
    echo 127.0.0.1 cses.fi/problemset/
    echo 127.0.0.1 www.cses.fi/problemset/
    echo 127.0.0.1 spoj.com
    echo 127.0.0.1 www.spoj.com
    echo 127.0.0.1 chat.openai.com
    echo 127.0.0.1 www.chat.openai.com
    echo 127.0.0.1 www.interviewbit.com
    echo 127.0.0.1 interviewbit.com
    echo 127.0.0.1 practice.geeksforgeeks.org
    echo 127.0.0.1 www.practice.geeksforgeeks.org
    echo 127.0.0.1 www.bing.com
    echo 127.0.0.1 bing.com
    echo 127.0.0.1 cp-algorithms.com
    echo 127.0.0.1 www.cp-algorithms.com
    echo 127.0.0.1 www.codeforces.com
    echo 127.0.0.1 codeforces.com
    echo 127.0.0.1 stackoverflow.com
    echo 127.0.0.1 www.stackoverflow.com
    echo 127.0.0.1 github.com
    echo 127.0.0.1 www.github.com
    echo 127.0.0.1 youtube.com
    echo 127.0.0.1 www.youtube.com
    echo 127.0.0.1 web.whatsapp.com
    echo 127.0.0.1 www.web.whatsapp.com
    echo 127.0.0.1 drive.google.com
    echo 127.0.0.1 www.drive.google.com
    echo 127.0.0.1 cl1p.net
    echo 127.0.0.1 www.cl1p.net
    echo 127.0.0.1 google.com
    echo 127.0.0.1 www.google.com
    echo 127.0.0.1 www.onlinegdb.com
    echo 127.0.0.1 onlinegdb.com
    echo 127.0.0.1 www.programiz.com
    echo 127.0.0.1 programiz.com
    echo 127.0.0.1 www.codingninjas.com
    echo 127.0.0.1 codingninjas.com
    echo 127.0.0.1 hackerearth.com
    echo 127.0.0.1 www.hackerearth.com
    echo 127.0.0.1 usaco.org
    echo 127.0.0.1 www.usaco.org
    echo 127.0.0.1 www.search.yahoo.com
    echo 127.0.0.1 search.yahoo.com
    echo 127.0.0.1 api.openai.com
    echo 127.0.0.1 www.api.openai.com
) >> "%file%"
endlocal