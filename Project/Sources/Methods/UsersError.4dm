//%attributes = {}
Case of 
		
	: (<>Operation=1)
		$message1:=Get_String("lib_backingUp")  //get from the xliff file : Backing up the user list failed.
		ALERT:C41($message1)
		
	: (<>Operation=2)
		$message2:=Get_String("lib_restoring")
		ALERT:C41($message2)
		
	: (<>Operation=3)  //login error
		GET WINDOW RECT:C443($lLeft; $lTop; $lRight; $lBottom)
		$lLeft_Left:=$lLeft-10
		$lRight_Left:=$lRight-10
		
		$lLeft_Right:=$lLeft+10
		$lRight_Right:=$lRight+10
		
		$lCurrentProcess:=Current process:C322
		For ($i; 1; 5)
			SET WINDOW RECT:C444($lLeft_Left; $lTop; $lRight_Left; $lBottom)
			DELAY PROCESS:C323($lCurrentProcess; 1)
			SET WINDOW RECT:C444($lLeft_Right; $lTop; $lRight_Right; $lBottom)
			DELAY PROCESS:C323($lCurrentProcess; 1)
		End for 
		SET WINDOW RECT:C444($lLeft; $lTop; $lRight; $lBottom)
		
	: (<>Operation=4)
		$message3:=Get_String("lib_privileges")
		ALERT:C41($message3)
		
End case 

<>Operation:=<>Operation*(-1)
