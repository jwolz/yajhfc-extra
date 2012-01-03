@echo off
if "%1"=="" goto usage
if "%2"=="" goto usage
if not exist "%1" goto usage

type %1 > \\.\pipe\%2
del %1
exit /B

:usage
echo Usage: pipeprint.cmd tempfile pipename
exit /B 1
