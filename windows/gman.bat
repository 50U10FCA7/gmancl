@echo off

setlocal
cd /d %~dp0

if [%1] == [] (
	set /p library=Enter library name: 
) else (
	set library=%1
)

if [%2] == [] (
	set /p script=Enter script name: 
) else (
	set script=%2
)

cd %library%
call %script%.bat %3 %4 %5 %6 %7