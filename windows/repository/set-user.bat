@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

if [%4] == [] (
	set /p user=Enter repository remote user: 
) else (
	set user=%4
)

set directory=.\..\..\%config_repositories_local%\%name%
cd %directory%

git remote remove origin
git remote add origin ssh://%user%@%config_ip%:%config_port%/%config_repositories_remote%/%name%.git
pause