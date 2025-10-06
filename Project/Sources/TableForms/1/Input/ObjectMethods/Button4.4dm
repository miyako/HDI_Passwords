
$N:=Selected record number:C246([UserInformation:2])
If ($n>0)
	READ WRITE:C146([UserInformation:2])
	GOTO SELECTED RECORD:C245([UserInformation:2]; $n)
	If ([UserInformation:2]UserID:1#0)
		
		If (Not:C34(Is user deleted:C616([UserInformation:2]UserID:1)))
			<>Operation:=4
			ON ERR CALL:C155("UsersError")
			DELETE USER:C615([UserInformation:2]UserID:1)
			If (<>Operation>0)
				
				DELETE RECORD:C58([UserInformation:2])
				ALL RECORDS:C47([UserInformation:2])
			Else 
				$mes:=Get_String("lib_alertSorry")
				ALERT:C41($mes)
			End if 
		Else 
			DELETE RECORD:C58([UserInformation:2])
			ALL RECORDS:C47([UserInformation:2])
			BEEP:C151
		End if 
	Else 
		DELETE RECORD:C58([UserInformation:2])
		ALL RECORDS:C47([UserInformation:2])
		BEEP:C151
	End if 
Else 
	BEEP:C151
End if 