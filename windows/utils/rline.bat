@echo off

setlocal enabledelayedexpansion

set filename=%1
set line=%2

set /a curline=0

for /f %%d in (%filename%) do (
	set /a curline+=1
	if !curline! == %line% (
		echo %%d
		exit /b
	)
)