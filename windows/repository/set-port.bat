@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

if [%4] == [] (
	set /p port=Enter repository remote port: 
) else (
	set port=%4
)

set directory=.\..\..\%config_repositories_local%\%name%
cd %directory%

git remote remove origin
git remote add origin ssh://%config_user%@%config_ip%:%port%/%config_repositories_remote%/%name%.git
pause