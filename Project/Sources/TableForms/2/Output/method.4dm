Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		If (Is user deleted:C616([UserInformation:2]UserID:1)) || (Not:C34(Is record loaded:C669([UserInformation:2])))
			FILTER EVENT:C321
		End if 
		
	: (Form event code:C388=On Display Detail:K2:22) | (Form event code:C388=On Load Record:K2:38)
		
		$n:=Displayed line number:C897
		If ($n<=Records in selection:C76([UserInformation:2]))
			If ([UserInformation:2]UserID:1#0)
				If (Not:C34(Is user deleted:C616([UserInformation:2]UserID:1)))
					GET USER PROPERTIES:C611([UserInformation:2]UserID:1; <>UserName; $UserMethod; $Password; $NbUse; $LastUse)
				Else 
					$del:=Get_String("lib_deleted")
					<>UserName:=$del  //Deleted
				End if 
			Else 
				<>UserName:=""
			End if 
		Else 
			<>UserName:=""
		End if 
		
	: (Form event code:C388=On Close Box:K2:21)
		
		CANCEL:C270
		
End case 
