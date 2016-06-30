@echo off
setlocal EnableDelayedExpansion
call ENV.bat
rem go to Department directory
cd %DPT%

rem list the files in the directory
del /f /q file_list_temp.txt
  dir /b /a:-d > file_list_temp.txt

rem get the department number of the files and copy to respective MMGROUP folder
for /f "tokens=*" %%I in ('dir *.%ext% /b /a:-d') do (
call %bin%\dep_num.bat "%%I" len
	echo Copying file with dept number !len!
	
	rem count the number of mapping of each department
	type %file_name% | find /c !len!>tmpfile.txt
	@set /P count=<tmpfile.txt
	rem echo !count!
	
	rem check if the department has only one MMU Group
	if !count! == 1 (
	rem map the department number of file with map.csv file and copy the file to respective MMGROUP folder
	for /f "tokens=1-2 delims=," %%a in ('findstr /L "!len!" %file_name%') do (
	if not exist %MMGROUP%\%%b ( mkdir %MMGROUP%\%%b )
	move  %DPT%\%%I  %MMGROUP%\%%b
	pause
	echo %%I moved successfully	
	)
	)
	
	rem Check if the department has multiple MMU Group
	if not !count! == 1 (
	rem map the department number of file with map.csv file and copy the file to respective MMGROUP folder
	for /f "tokens=1-2 delims=," %%a in ('findstr /L "!len!" %file_name%') do (
	if not exist %MMGROUP%\%%b ( mkdir %MMGROUP%\%%b )
	copy  %DPT%\%%I  %MMGROUP%\%%b
	pause
	echo %%I copied successfully	
	)
	)
	
	pause 
	rem delete files that are copied
	for /f "tokens=1-2 delims=," %%a in ('findstr /L "!len!" %file_name%') do (
	if exist %MMGROUP%\%%b\%%I del /q %DPT%\%%I
	)
		pause
	
)
	