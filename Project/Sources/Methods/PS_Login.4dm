//%attributes = {}
C_LONGINT:C283($1)
C_LONGINT:C283($lWindID)

If (Count parameters:C259=0)
	ALL RECORDS:C47([PREFERENCES:1])
	<>PS_Login:=New process:C317(Current method name:C684; 32*1024; Current method name:C684; [PREFERENCES:1]LoginDialogType:1)
	BRING TO FRONT:C326(<>PS_Login)
Else 
	
	$LoginKind:=$1
	
	Case of 
		: ($LoginKind=0)
			CHANGE CURRENT USER:C289
			
		: ($LoginKind=1)
			<>WIN_Login:=Open form window:C675("D_Login"; 5; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("D_Login")
			CLOSE WINDOW:C154(<>WIN_Login)
			<>WIN_Login:=0
	End case 
	<>PS_Login:=0
	
End if 
