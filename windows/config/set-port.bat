@echo off

if [%3] == [] (
	set /p port=Enter remote port: 
) else (
	set port=%3
)

setlocal enabledelayedexpansion

set repositories=.\..\..\%config_repositories_local%
cd %repositories%
for /d %%D in (.\*) do (
	cd %%~nxD

	git remote remove origin
	git remote add origin ssh://%config_user%@%config_ip%:%port%/%config_repositories_remote%/%%~nxD.git

	cd %repositories%
)

endlocal

set gman=.\..\gman.bat
set writeline=.\..\utils\wline.bat
start cmd /k "%writeline% %gman% 22 "config_port=%port%" & exit"