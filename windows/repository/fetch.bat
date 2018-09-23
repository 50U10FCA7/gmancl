@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

git clone ssh://%config_user%@%config_ip%:%config_port%/%config_repositories_remote%/%name%.git .\..\..\%config_repositories_local%\%name%