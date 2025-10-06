
//Form method, common to all own password dialog
C_PICTURE:C286($EmptyPict)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		//lets' get the entire list of users defined in 4D structure
		//(some of them may be "deleted users")
		GET USER LIST:C609(<>_UsersNames; <>_UsersIDs)
		
		$n:=Size of array:C274(<>_UsersIDs)
		ARRAY PICTURE:C279(<>_UsersIcons; 0)
		$Keep:=0
		
		For ($i; 1; $n)
			If (Not:C34(Is user deleted:C616(<>_UsersIDs{$i})))
				QUERY:C277([UserInformation:2]; [UserInformation:2]UserID:1=<>_UsersIDs{$i})
				If (Records in selection:C76([UserInformation:2])=1)
					If ([UserInformation:2]VisibleInDialog:3)
						$Keep:=$Keep+1
						<>_UsersIDs{$Keep}:=<>_UsersIDs{$i}
						<>_UsersNames{$keep}:=<>_UsersNames{$i}
						APPEND TO ARRAY:C911(<>_UsersIcons; $EmptyPict)
						<>_UsersIcons{Size of array:C274(<>_UsersIcons)}:=[UserInformation:2]UserIcon:2
					End if 
				End if 
			End if 
		End for 
		
		DELETE FROM ARRAY:C228(<>_UsersIDs; $Keep+1; $n+1-$Keep)
		DELETE FROM ARRAY:C228(<>_UsersNames; $Keep+1; $n+1-$Keep)
		
		SORT ARRAY:C229(<>_UsersNames; <>_UsersIDs; <>_UsersIcons; >)
		
		<>UserName:=""
		<>UserPassword:=""
		OBJECT SET FONT:C164(<>UserPassword; "%Password")
		
		<>CurrentPage:=1
		
	: (Form event code:C388=On Unload:K2:2)
		
		
End case 
