ON ERR CALL:C155("UsersError")
SET BLOB SIZE:C606([PREFERENCES:1]UserInformation:2; 0)
<>Operation:=1
USERS TO BLOB:C849([PREFERENCES:1]UserInformation:2)
If (<>Operation>0)
	SAVE RECORD:C53([PREFERENCES:1])
	$mes:=Get_String("lib_alertSaved")
	ALERT:C41($mes)
	//_O_ENABLE BUTTON(<>bRestore)
	OBJECT SET ENABLED:C1123(*; "bRestore"; True:C214)
End if 

ON ERR CALL:C155("")