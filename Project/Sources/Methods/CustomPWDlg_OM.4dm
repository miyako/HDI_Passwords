//%attributes = {"invisible":true}
C_LONGINT:C283($1)  //form event

C_POINTER:C301($2)  //ptr object


Case of 
	: ($1=On Clicked:K2:4)
		Case of 
			: ($2=(->lBttn_ChangeAccess))
				CHANGE CURRENT USER:C289
				
			: ($2=(->lBttn_Remove))
				ON ERR CALL:C155("IgnoreError")
				_O_DELETE RESOURCE:C501("PICT"; <>KPICTID)
				ON ERR CALL:C155("")
				piPWCurrentLogo:=piPWCurrentLogo*0
				
			: ($2=(->lBttn_Set))
				//delete current custom picture
					
				CustomPWDlg_OM($1; ->lBttn_Remove)
				//write the new one
					
				_O_SET PICTURE RESOURCE:C503(<>KPICTID; piPWLogo)
				If (OK=1)
					//display it
						
					GET PICTURE RESOURCE:C502(<>KPICTID; piPWCurrentLogo)
					
				End if 
				
				
			: ($2=(->lBttn_SelectFile))
				$tDocRef:=Open document:C264(""; ""; Get pathname:K24:6)
				If (OK=1)
					READ PICTURE FILE:C678(Document; piPWLogo)
				End if 
				
				
		End case 
		
End case 
