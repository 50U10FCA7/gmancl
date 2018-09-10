@echo off

if [%1] == [] (
	set /p name=Enter repository name: 
) else (
	set name=%1
)

set config=.\..\..\config.txt
set readline=.\..\utils\rline.bat

for /f "tokens=*" %%v in ('%readline% %config% 1') do set config_user=%%v
for /f "tokens=*" %%v in ('%readline% %config% 2') do set config_ip=%%v
for /f "tokens=*" %%v in ('%readline% %config% 3') do set config_port=%%v
for /f "tokens=*" %%v in ('%readline% %config% 4') do set config_repositories_remote=%%v
for /f "tokens=*" %%v in ('%readline% %config% 5') do set config_repositories_local=%%v

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
pause