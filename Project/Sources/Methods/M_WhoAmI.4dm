//%attributes = {}

$log:=Get_String("lib_loggedAs")
ALERT:C41(Replace string:C233($log; "%1"; Current user:C182))  //you're now logged in as…
