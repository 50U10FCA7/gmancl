@echo off

set filename=%1
set linenumber=%2
set contents=%3

set tmp=%random%-%random%.tmp
set numline=0

>%tmp% (
	setlocal DisableDelayedExpansion

  	for /F "delims=" %%L in ('findstr /n "^" "%filename%"') do (
	    set "line=%%L"
    	set /a numline+=1

		setlocal EnableDelayedExpansion

    	if !numline! == %linenumber% (
			echo set %contents%
		) else (
			set "line=!line:*:=!"

			if "!line!"=="" (
				echo.
			) else (
				echo !line!
			)
		)

		endlocal
  	)
)

del %filename%
move %tmp% %filename%