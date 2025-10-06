If (Form event code:C388=On Load:K2:1)
	<>UserPassword:=""
End if 

UserInputScript(Self:C308; "Password")

/*
should use placeholders instead
*/

If (<>UserPassword="Password")
	OBJECT SET FONT:C164(<>UserPassword; OBJECT Get font:C1069(*; ""))
Else 
	OBJECT SET FONT:C164(<>UserPassword; "%Password")
End if 

If (<>UserPassword#"Password") & (<>UserPassword#"")
	//_O_ENABLE BUTTON(bOK)
	OBJECT SET ENABLED:C1123(*; "bOK"; True:C214)
Else 
	//_O_DISABLE BUTTON(bOK)
	OBJECT SET ENABLED:C1123(*; "bOK"; False:C215)
End if 