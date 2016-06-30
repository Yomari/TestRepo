@echo off

		set TST=%~1
		echo %TST%
		set K=0
		set L=-1
		set M=-1
		:l
		 if "!TST:~%K%,1!"=="." goto ld
		 if "!TST:~%K%,1!"=="_" (
		 set L=%M%
		 SET M=%K%
		)
		 set /a K+=1
		 goto l
		:ld
		 rem echo %L%,%M%,%K%
		 set /a M+=1
		 set /a N=%K%-%M%
		rem set /a P=%M%-1
		rem set rep_name="!TST:~0,%P%!"
		 set name="!TST:~%M%,%N%!"
		 SET %2=%name%
		rem set %3=%rep_name%
exit /b

