//%attributes = {}
// ------------------------------------------------------------------------------------------------
// Method : Get_XLIFF_byResName
// Created06/15/06 by roland lannuzel
// Returns the corresponding string for "resname" attribute

//$1 path of a .lproj folder to browse
//$2 resname value

// Based on method made by Vincent de Lachaux
// -------------------------------------------------------------------------------------------------
// Syntax

// Get_Localized_Indexed_String(lprojPath;resname) -> String
// -------------------------------------------------------------------------------------------------

C_TEXT:C284($0)

C_TEXT:C284($1)  //lprojPath
C_TEXT:C284($2)  //resname
C_TEXT:C284($3)  //xliff file path (second call if recursive)

C_LONGINT:C283($i; $Nb_Parameters)
_O_C_STRING:C293(16; $Group; $Root; $Unit; $Source)
C_TEXT:C284($Buffer; $Group_ID; $ID; $Index; $Method; $Path; $Unit_ID; $Value)
C_TEXT:C284($Value)

If (False:C215)
	C_TEXT:C284(Lang_GetStringByResname; $1)  //path of the lproj folder
	C_TEXT:C284(Lang_GetStringByResname; $2)  //resname to find
	C_TEXT:C284(Lang_GetStringByResname; $3)  //name of the xliff file (optional)
	
	C_TEXT:C284(Lang_GetStringByResname; $0)
	
End if 

$Nb_Parameters:=Count parameters:C259
$Resname:=$2

If ($Nb_Parameters>2)
	
	$Path:=$3
	
	If (Length:C16($Path)>0)
		
		$Method:=Method called on error:C704
		ON ERR CALL:C155("NO_ERROR")
		$Root:=DOM Parse XML source:C719($Path; False:C215)
		$Found:=False:C215
		$Value:=""
		
		If (OK=1)
			//Get the first group (maybe there is only one, but there is at least one !)
			$Group:=DOM Find XML element:C864($Root; "/xliff/file/body/group")
			If (OK=1)
				Repeat 
					
					//Get the group ID
					//DOM LIRE ATTRIBUT XML PAR NOM($Group;"id";$ID)
					//Si ($ID=$Group_ID)
					//Find : Get the first Unit
					$Unit:=DOM Get first child XML element:C723($Group)
					
					Repeat 
						
						//Get the Unit resname
						DOM GET XML ATTRIBUTE BY NAME:C728($Unit; "resname"; $value)
						If ($resname#$value)
							//See next one
							$Unit:=DOM Get next sibling XML element:C724($Unit)
						End if 
					Until (($resname=$value) | (OK=0))
					If (OK=1)
						//Get the target
						$Source:=DOM Get first child XML element:C723($Unit)
						//Is the string translatable ? …
						DOM GET XML ATTRIBUTE BY NAME:C728($Unit; "translate"; $Buffer)
						If ($Buffer="no")
							//… no : Get the source string
							DOM GET XML ELEMENT VALUE:C731($Source; $Value)
						Else 
							//… yes : Get the target string
							$Source:=DOM Get next sibling XML element:C724($Source)
							DOM GET XML ELEMENT VALUE:C731($Source; $Value)
						End if 
						$Found:=True:C214
					Else 
						//See next group
						$value:=""
						$Group:=DOM Get next sibling XML element:C724($Group)
					End if 
					
				Until (($Found) | (OK=0))
				
			End if 
			DOM CLOSE XML:C722($Root)
		End if 
		ON ERR CALL:C155($Method)
	End if 
	$0:=$Value
	
Else 
	
	$Path:=$1
	
	If (Length:C16($Path)>0)
		ARRAY TEXT:C222($Documents; 0)
		DOCUMENT LIST:C474($Path; $Documents)  // Get all the documents in the ".lproj" folder
		$n:=Size of array:C274($Documents)
		For ($i; 1; $n)
			If ($Documents{$i}="@.xlf")  // Is the document an XLIFF file?
				$0:=Lang_GetStringByResname($1; $2; $Path+$Documents{$i})
				If ($0#"")
					$i:=$n+1  //exit loop
				End if 
			End if 
		End for 
	End if 
End if 



