@echo off

if [%3] == [] (
	set /p repositories_remote=Enter remote repositories path: 
) else (
	set repositories_remote=%3
)

setlocal enabledelayedexpansion

set repositories=.\..\..\%config_repositories_local%
cd %repositories%
for /d %%D in (.\*) do (
	cd %%~nxD

	git remote remove origin
	git remote add origin ssh://%config_user%@%config_ip%:%config_port%/%repositories_remote%/%%~nxD.git

	cd %repositories%
)

endlocal

set gman=.\..\gman.bat
set writeline=.\..\utils\wline.bat
start cmd /k "%writeline% %gman% 23 "config_repositories_remote=%repositories_remote%" & exit"