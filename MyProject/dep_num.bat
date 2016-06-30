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
		 set /a L+=1
		 set /a N=%M%-%L%
		 set name="!TST:~%L%,%N%!"
		 SET %2=%name%
exit /b

