//%attributes = {}
C_BOOLEAN:C305($1)
C_LONGINT:C283($lWindID)

If (Count parameters:C259=0)
	BRING TO FRONT:C326(New process:C317(Current method name:C684; 32*1024; Current method name:C684; True:C214; *))
Else 
	Compiler_Variables
	SET MENU BAR:C67(1; *)
	$lWindID:=Open form window:C675([PREFERENCES:1]; "Custom4DWDialog_Dlg"; 5; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40([PREFERENCES:1]; "Custom4DWDialog_Dlg")
	CLOSE WINDOW:C154
End if 
