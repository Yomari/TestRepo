@echo off
setlocal EnableDelayedExpansion
set file_name=E:\Prranesh\Scripts\map.csv
set DPT=E:\Prranesh\Scripts\Department
set MMGROUP=E:\Prranesh\Scripts\MMGROUP


 rem go to Department directory
 cd %DPT%
 
 rem list the files in the directory
  del /f /q file_list_temp.txt
	  dir /b /a:-d > file_list_temp.txt
   
 rem get the department number of the files and copy to respective MMGROUP folder
   for /f "tokens=*" %%I in ('dir *.pdf /b /a:-d') do (
	call E:\Prranesh\Scripts\dep_num.bat "%%I" len
		echo Copying file with dept number !len!
			
		rem map the department number of file with map.csv file and copy the file to respective MMGROUP folder
		for /f "tokens=1-2 delims=," %%a in ('findstr /L "!len!" %file_name%') do  copy  %DPT%\%%I  %MMGROUP%\%%b
		
		echo %%I copied successfully
		
		
 )
 