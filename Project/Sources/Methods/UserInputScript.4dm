//%attributes = {}
C_POINTER:C301($1)  //object

C_TEXT:C284($2)  //default value


C_POINTER:C301($Object)
C_TEXT:C284($DefaultValue)
$Object:=$1
$DefaultValue:=$2

Case of 
	: (Form event code:C388=On Getting Focus:K2:7) | (Form event code:C388=On Load:K2:1)
		
		If ($Object->="") | ($Object->=$DefaultValue)
			$Object->:=$DefaultValue
			OBJECT SET RGB COLORS:C628($Object->; 8421504; 16777215)  //grey with a white background
				
		Else 
			OBJECT SET RGB COLORS:C628($Object->; 0; 16777215)  //black with a white background
				
		End if 
		
		HIGHLIGHT TEXT:C210($Object->; 0; 32000)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		
		If ($Object->="") | ($Object->=$DefaultValue)
			$Object->:=$DefaultValue
			OBJECT SET RGB COLORS:C628($Object->; 8421504; 16777215)  //grey with a white background
				
		Else 
			OBJECT SET RGB COLORS:C628($Object->; 0; 16777215)  //black with a white background
				
		End if 
		
	: (Form event code:C388=On After Keystroke:K2:26)
		
		$Text:=Get edited text:C655
		If ($Text="") | ($Text=$DefaultValue)
			$Object->:=$DefaultValue
			OBJECT SET RGB COLORS:C628($Object->; 8421504; 16777215)  //grey with a white background
				
			HIGHLIGHT TEXT:C210($Object->; 0; 32000)
		Else 
			$Object->:=$Text
			OBJECT SET RGB COLORS:C628($Object->; 0; 16777215)  //black with a white background
				
		End if 
		
End case 
