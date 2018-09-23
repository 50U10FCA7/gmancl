@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

set directory=.\..\..\%config_repositories_local%\%name%
if not exist %directory% (
	mkdir %directory%
)

cd %directory%
set /p tmp=Place repository files in "%directory%"

git init
git add .
git commit -m "Initial commit"
git remote add origin ssh://%config_user%@%config_ip%:%config_port%/%config_repositories_remote%/%name%.git