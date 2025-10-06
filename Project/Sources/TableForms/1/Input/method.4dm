Case of 
		
	: (Form event code:C388=On Load:K2:1) | (<>Relaunch=True:C214)
		
		If ([PREFERENCES:1]LoginDialogType:1=0)
			<>br1:=1
			<>br2:=0
		Else 
			<>br1:=0
			<>br2:=1
		End if 
		
		C_LONGINT:C283(<>TabList)
		
		If (Is a list:C621(<>TabList))
			CLEAR LIST:C377(<>TabList)
		End if 
		
		<>TabList:=New list:C375
		$pref:=Get_String("lib_preferences")
		APPEND TO LIST:C376(<>TabList; $pref; 1)
		$users:=Get_String("lib_users")
		APPEND TO LIST:C376(<>TabList; $users; 2)
		
		If (User in group:C338(Current user:C182; "Staff"))  // | True
			SET LIST ITEM PROPERTIES:C386(<>TabList; 2; True:C214; 0; 0)
			ALL RECORDS:C47([UserInformation:2])
		Else 
			SET LIST ITEM PROPERTIES:C386(<>TabList; 2; False:C215; 0; 0)
		End if 
		
		
		If (Current user:C182="administrator")
			
			//_O_ENABLE BUTTON(<>bBackup)
			OBJECT SET ENABLED:C1123(*; "bBackup"; True:C214)
			
			If (BLOB size:C605([PREFERENCES:1]UserInformation:2)<=0)
				//_O_DISABLE BUTTON(<>bRestore)
				OBJECT SET ENABLED:C1123(*; "bRestore"; False:C215)
			Else 
				//_O_ENABLE BUTTON(<>bRestore)
				OBJECT SET ENABLED:C1123(*; "bRestore"; True:C214)
			End if 
			OBJECT SET VISIBLE:C603(*; "BackupInfo"; False:C215)
			
		Else 
			
			//_O_DISABLE BUTTON(<>bRestore)
			OBJECT SET ENABLED:C1123(*; "bRestore"; False:C215)
			//_O_DISABLE BUTTON(<>bBackup)
			OBJECT SET ENABLED:C1123(*; "bBackup"; False:C215)
			OBJECT SET VISIBLE:C603(*; "BackupInfo"; True:C214)
		End if 
		
		$log:=Get_String("lib_loggedAs")
		<>LoginInfo:=Replace string:C233($log; "%1"; Current user:C182)  //you're now logged in as…
		<>Relaunch:=False:C215
		
	: (Form event code:C388=On Close Box:K2:21)
		
		ACCEPT:C269
		
End case 
