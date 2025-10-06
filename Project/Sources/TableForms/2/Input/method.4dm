C_LONGINT:C283(<>NbUse)
C_DATE:C307(<>LastUse)
C_TEXT:C284(<>UserPassword)

C_TEXT:C284(<>UserName)
C_TEXT:C284(<>UserPassword)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If ([UserInformation:2]UserID:1=0)  //new user to be created
			[UserInformation:2]UserID:1:=-1
			
			<>UserName:=""
			<>UserMethod:=""
			<>Password:=""
			<>NbUse:=0
			<>LastUse:=!00-00-00!
			
			
			//GET PICTURE FROM LIBRARY(2024; [UserInformation]UserIcon)  //default icon
			READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/IconUserDefault.png").platformPath; [UserInformation:2]UserIcon:2)
			UserBuildIcon  //add frame
			
		Else 
			GET USER PROPERTIES:C611([UserInformation:2]UserID:1; <>UserName; <>UserMethod; <>Password; <>NbUse; <>LastUse)
		End if 
		
		//_O_DISABLE BUTTON(bOK)
		OBJECT SET ENABLED:C1123(*; "bOK"; False:C215)
		GOTO OBJECT:C206(<>UserName)
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		
End case 
