@echo off

if [%3] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%3
)

rmdir /s .\..\..\%config_repositories_local%\%name%