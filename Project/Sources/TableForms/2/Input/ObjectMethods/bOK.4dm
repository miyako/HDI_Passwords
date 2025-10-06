If (<>UserPassword="") | (<>UserPassword="Password")
	[UserInformation:2]UserID:1:=Set user properties:C612([UserInformation:2]UserID:1; <>UserName; <>UserMethod; *; <>NbUse; <>LastUse)
Else 
	[UserInformation:2]UserID:1:=Set user properties:C612([UserInformation:2]UserID:1; <>UserName; <>UserMethod; <>UserPassword; <>NbUse; <>LastUse)
End if 
