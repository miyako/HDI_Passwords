//%attributes = {}
C_PICTURE:C286($Mask)
//GET PICTURE FROM LIBRARY(2025; $Mask)  //default mask
READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/UserIconMask.png").platformPath; $Mask)

PICTURE PROPERTIES:C457([UserInformation:2]UserIcon:2; $Length; $Height)

If ($Length=0) & ($Height=0)
	//GET PICTURE FROM LIBRARY(2024; [UserInformation]UserIcon)  //default icon
	READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/IconUserDefault.png").platformPath; [UserInformation:2]UserIcon:2)
	PICTURE PROPERTIES:C457([UserInformation:2]UserIcon:2; $Length; $Height)
End if 

If ($Length>52) | ($Height>52)
	//the picture is too large let's reduce it
	If ($Length>$Height)
		$Ratio:=52/$Length
	Else 
		$Ratio:=52/$Height
	End if 
	$Length:=$Length*$Ratio
	$Height:=$Height*$Ratio
	CREATE THUMBNAIL:C679([UserInformation:2]UserIcon:2; [UserInformation:2]UserIcon:2; $Length; $Height)
End if 

If ($Length<64)
	//lets calculate the horizontal shift
	$H:=Int:C8((64-$Length)/2)
Else 
	$H:=0
End if 

If ($Height<64)
	//lets calculate the vertical shift
	$V:=Int:C8((64-$Height)/2)
Else 
	$V:=0
End if 

[UserInformation:2]UserIcon:2:=$H+[UserInformation:2]UserIcon:2  //shift horizontally
[UserInformation:2]UserIcon:2:=$V/[UserInformation:2]UserIcon:2  //shift vertically
[UserInformation:2]UserIcon:2:=$Mask & [UserInformation:2]UserIcon:2  //blend with the mask
