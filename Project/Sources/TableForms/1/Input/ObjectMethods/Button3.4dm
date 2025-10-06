//Check if all 4D Users are in the table. If not, create missing users


_O_ARRAY STRING:C218(255; <>_UsersNames; 0)
ARRAY LONGINT:C221(<>_UsersIDs; 0)
GET USER LIST:C609(<>_UsersNames; <>_UsersIDs)

For ($loop; 1; Size of array:C274(<>_UsersIDs))
	If (Not:C34(Is user deleted:C616(<>_UsersIDs{$loop})))
		QUERY:C277([UserInformation:2]; [UserInformation:2]UserID:1=<>_UsersIDs{$loop})
		
		If (Records in selection:C76([UserInformation:2])=0)
			CREATE RECORD:C68([UserInformation:2])
			[UserInformation:2]UserID:1:=<>_UsersIDs{$loop}
			//GET PICTURE FROM LIBRARY(2024; [UserInformation]UserIcon)
			READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/IconUserDefault.png").platformPath; [UserInformation:2]UserIcon:2)
			
			[UserInformation:2]VisibleInDialog:3:=False:C215
			
			SAVE RECORD:C53([UserInformation:2])
		End if 
	End if 
End for 

ALL RECORDS:C47([UserInformation:2])
