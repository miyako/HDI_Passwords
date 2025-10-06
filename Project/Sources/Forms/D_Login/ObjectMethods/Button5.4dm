
FORM SET VERTICAL RESIZING:C893(True:C214; 0; 32000)  //no limits for chages done by programming !

If (<>CurrentPage=1)
	
	<>CurrentPage:=2
	
	Repeat 
		//Let's calculate the relative vertical change of size of the window
		//the changing must be progressive so we just change the size of half the difference at each step
		GET WINDOW RECT:C443($Left; $Top; $Right; $Bottom)
		$CurrentHight:=$Bottom-$Top
		$MoveVertical:=Round:C94((150-$CurrentHight)/2; 0)
		RESIZE FORM WINDOW:C890(0; $MoveVertical)
	Until ($MoveVertical=0)
	
	//on page 2 resizing is not allowed
	FORM SET VERTICAL RESIZING:C893(False:C215)
	
	GOTO OBJECT:C206(<>UserName)
	<>UserName:=""
	<>UserPassword:=""
	$liste:=Get_String("btn_list")
	OBJECT SET TITLE:C194(<>bSwap; $liste)  //liste
Else 
	
	<>CurrentPage:=1
	
	Repeat 
		//Let's calculate the relative vertical change of size of the window
		//the changing must be progressive so we just change the size of half the difference at each step
		GET WINDOW RECT:C443($Left; $Top; $Right; $Bottom)
		$CurrentHight:=$Bottom-$Top
		$MoveVertical:=Round:C94((400-$CurrentHight)/2; 0)
		RESIZE FORM WINDOW:C890(0; $MoveVertical)
	Until ($MoveVertical=0)
	
	//on page 1 resizing is allowed
	FORM SET VERTICAL RESIZING:C893(True:C214; 400; 32000)
	
	If (<>_UsersNames#0)
		<>UserName:=<>_UsersNames{<>_UsersNames}
	Else 
		<>UserName:=""
	End if 
	
	GOTO OBJECT:C206(<>UserPassword)
	$autre:=Get_String("btn_other")
	OBJECT SET TITLE:C194(<>bSwap; $autre)  //Autre
	
End if 


FORM GOTO PAGE:C247(<>CurrentPage)