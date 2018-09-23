@echo off

if [%3] == [] (
	set /p ip=Enter remote ip: 
) else (
	set ip=%3
)

setlocal enabledelayedexpansion

set repositories=.\..\..\%config_repositories_local%
cd %repositories%
for /d %%D in (.\*) do (
	cd %%~nxD

	git remote remove origin
	git remote add origin ssh://%config_user%@%ip%:%config_port%/%config_repositories_remote%/%%~nxD.git

	cd %repositories%
)

endlocal

set gman=.\..\gman.bat
set writeline=.\..\utils\wline.bat
start cmd /k "%writeline% %gman% 21 "config_ip=%ip%" & exit"