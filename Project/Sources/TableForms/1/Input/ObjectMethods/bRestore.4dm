If (BLOB size:C605([PREFERENCES:1]UserInformation:2)>0)
	
	ON ERR CALL:C155("UsersError")
	<>Operation:=2
	BLOB TO USERS:C850([PREFERENCES:1]UserInformation:2)
	
	ON ERR CALL:C155("")
	
Else 
	
End if 