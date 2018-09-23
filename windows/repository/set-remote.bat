@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

if [%4] == [] (
	set /p repositories_remote=Enter repository remote path: 
) else (
	set repositories_remote=%4
)

set directory=.\..\..\%config_repositories_local%\%name%
cd %directory%

git remote remove origin
git remote add origin ssh://%config_user%@%config_ip%:%config_port%/%repositories_remote%/%name%.git
pause