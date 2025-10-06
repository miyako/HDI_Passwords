//Si (◊CurrentPage=1)
//◊UserName:=◊_UsersNames{◊_UsersNames}
//Fin de si


ON ERR CALL:C155("UsersError")
<>Operation:=3
CHANGE CURRENT USER:C289(<>UserName; <>UserPassword)
ON ERR CALL:C155("")

If (<>Operation>0)
	ACCEPT:C269
End if 

