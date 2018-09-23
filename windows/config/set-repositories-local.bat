@echo off

if [%3] == [] (
	set /p repositories_local=Enter local repositories path: 
) else (
	set repositories_local=%3
)

set repositories=.\..\..\%repositories_local%
set config_repositories=.\..\..\%config_repositories_local%

mkdir %repositories%
move %config_repositories%\* %repositories%
del %repositories%

set gman=.\..\gman.bat
set writeline=.\..\utils\wline.bat
start cmd /k "%writeline% %gman% 24 "config_repositories_local=%repositories_local%" & exit"