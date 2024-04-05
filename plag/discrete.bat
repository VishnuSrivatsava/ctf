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
set "tempfile=%temp%\hosts"

:: List of websites to unblock
set "websites=www.pastebin.com pastebin.com www.codechef.com codechef.com www.geeksforgeeks.org geeksforgeeks.org leetcode.com www.leetcode.com topcoder.com www.topcoder.com atcoder.jp www.atcoder.jp cses.fi/problemset/ www.cses.fi/problemset/ spoj.com www.spoj.com chat.openai.com www.chat.openai.com www.interviewbit.com interviewbit.com practice.geeksforgeeks.org www.practice.geeksforgeeks.org www.bing.com bing.com cp-algorithms.com www.cp-algorithms.com www.codeforces.com codeforces.com stackoverflow.com www.stackoverflow.com github.com www.github.com youtube.com www.youtube.com web.whatsapp.com www.web.whatsapp.com drive.google.com www.drive.google.com cl1p.net www.cl1p.net google.com www.google.com www.onlinegdb.com onlinegdb.com www.programiz.com programiz.com www.codingninjas.com codingninjas.com hackerearth.com www.hackerearth.com usaco.org www.usaco.org www.search.yahoo.com search.yahoo.com"

:: Create a new temporary hosts file without the blocked websites
for /F "delims=" %%A in ('type "%file%"') do (
    set "line=%%A"
    setlocal enabledelayedexpansion
    for %%B in (%websites%) do if "!line!"=="127.0.0.1 %%B" set "line="
    if defined line echo !line!>>"%tempfile%"
    endlocal
)

:: Replace the original hosts file with the new one
move /Y "%tempfile%" "%file%"
endlocal