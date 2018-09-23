@echo off
set basedir=%~dp0
cd /d %basedir%

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



::config
set "config_user=username"
set "config_ip=127.0.0.1"
set "config_port=1337"
set "config_repositories_remote=home/username/gman_repositories"
set "config_repositories_local=repositories"
::config_repositories_remote - sets without '/' at start and end
::config_repositories_local - sets without '/' at start and end, locals from gmancl directory



cd %library%
call %script% %*
cd /d %basedir%
