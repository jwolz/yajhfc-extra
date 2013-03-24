@echo off
rem echo %* > c:\args.txt

rem Parse Command line arguments...

set TFILE=
:parseTF
if "%1"=="" goto endparseTF
if "%1"==":" goto endparseTF
set TFILE=%TFILE% %1
shift
goto parseTF
:endparseTF
set TFILE=%TFILE:~1%
shift

set PIPENAME=
:parsePN
if "%1"=="" goto endparsePN
set PIPENAME=%PIPENAME% %1
shift
goto parsePN
:endparsePN
set PIPENAME=%PIPENAME:~1%

rem Arguments parsed
rem echo TFILE: "%TFILE%" ; PIPENAME: "%PIPENAME%" >> c:\args.txt

if "%TFILE%"=="" goto usage
if "%PIPENAME%"=="" goto usage
if not exist "%TFILE%" goto usage

type "%TFILE%" > "\\.\pipe\%PIPENAME%" 
del "%TFILE%"
exit /B

:usage
echo Usage: pipeprint.cmd tempfile : pipename
exit /B 1
