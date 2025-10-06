//%attributes = {}
C_BOOLEAN:C305($1)
C_LONGINT:C283($lWindID)

If (Count parameters:C259=0)
	If (<>PS_Preferences=0) | (Shift down:C543)
		<>PS_Preferences:=New process:C317("PS_Preferences"; 0; "PS_Preferences"; True:C214)
	End if 
	BRING TO FRONT:C326(<>PS_Preferences)
	
Else 
	
	SET MENU BAR:C67(1)
	
	ARRAY TEXT:C222(<>_LoginKind; 0)
	INSERT IN ARRAY:C227(<>_LoginKind; 1; 2)
	<>_LoginKind{1}:="4D Dialog"
	<>_LoginKind{2}:="Custom dialog"
	
	FORM SET INPUT:C55([PREFERENCES:1]; "Input")
	FORM SET OUTPUT:C54([PREFERENCES:1]; "Output")
	
	READ WRITE:C146([PREFERENCES:1])
	READ WRITE:C146([UserInformation:2])
	
	ALL RECORDS:C47([PREFERENCES:1])
	
	If (Records in selection:C76([PREFERENCES:1])#1)
		DELETE SELECTION:C66([PREFERENCES:1])
		CREATE RECORD:C68([PREFERENCES:1])
		[PREFERENCES:1]LoginDialogType:1:=1
		SAVE RECORD:C53([PREFERENCES:1])
	End if 
	
	<>Win_Preferences:=Open form window:C675([PREFERENCES:1]; "Input"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	<>Relaunch:=True:C214
	MODIFY RECORD:C57([PREFERENCES:1]; *)
	UNLOAD RECORD:C212([PREFERENCES:1])
	CLOSE WINDOW:C154
	
	<>Win_Preferences:=0
	<>PS_Preferences:=0
	
End if 