@echo off

if [%3] == [] (
	set /p username=Enter remote user name: 
) else (
	set username=%3
)

setlocal enabledelayedexpansion

set repositories=.\..\..\%config_repositories_local%
cd %repositories%
for /d %%D in (.\*) do (
	cd %%~nxD

	git remote remove origin
	git remote add origin ssh://%username%@%config_ip%:%config_port%/%config_repositories_remote%/%%~nxD.git

	cd %repositories%
)

endlocal

set gman=.\..\gman.bat
set writeline=.\..\utils\wline.bat
start cmd /k "%writeline% %gman% 20 "config_user=%username%" & exit"