//%attributes = {}
QUERY:C277([UserInformation:2]; [UserInformation:2]UserID:1=5)
If (Records in selection:C76([UserInformation:2])=1)
	
	GET USER PROPERTIES:C611([UserInformation:2]UserID:1; <>UserName; <>UserMethod; <>Password; <>NbUse; <>LastUse)
	<>UserPassword:=Substring:C12(<>UserName; 1; 1)
	[UserInformation:2]UserID:1:=Set user properties:C612([UserInformation:2]UserID:1; <>UserName; <>UserMethod; <>UserPassword; <>NbUse; <>LastUse)
	
End if 