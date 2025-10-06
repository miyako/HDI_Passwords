
PS_Login([PREFERENCES:1]LoginDialogType:1)  //send a parameter = keep in same process


If (User in group:C338(Current user:C182; "Staff"))
	SET LIST ITEM PROPERTIES:C386(<>TabList; 2; True:C214; 0; 0)
	ALL RECORDS:C47([UserInformation:2])
Else 
	SET LIST ITEM PROPERTIES:C386(<>TabList; 2; False:C215; 0; 0)
End if 

REDRAW:C174(<>TabList)
REDRAW WINDOW:C456
$log:=Get_String("lib_loggedAs")
<>LoginInfo:=Replace string:C233($log; "%1"; Current user:C182)  //you're now logged as…

<>Relaunch:=True:C214
