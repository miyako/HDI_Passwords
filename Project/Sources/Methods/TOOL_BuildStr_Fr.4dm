//%attributes = {}
$CR:=Char:C90(13)
$Range:=16000  //16001, 16002, etc.

//-------------------------------------------------------------------------------- form FR str#

ARRAY TEXT:C222($_Text; 60)
$_Text{1}:="4D Passwords"
$_Text{2}:="Par l’équipe Marketing France"
$_Text{3}:="© 4D S.A. 2004"
$_Text{4}:="Au sujet de “4D Passwords”…"
$_Text{5}:=""
$_Text{6}:="Choisissez votre langue S.V.P."
$_Text{7}:="Préférences"
$_Text{8}:="Dialogue standard 4D"
$_Text{9}:="Dialogue personnalisé"
$_Text{10}:="Dialogue d'ouverture :"
$_Text{11}:="Sauvegarde"
$_Text{12}:="Restauration"
$_Text{13}:="Mise à jour"
$_Text{14}:="Suppression"
$_Text{15}:="Nouveau"
$_Text{16}:="N.B. La sauvegarde et la restauration ne sont accessibles qu'à l'administrateur."
$_Text{17}:="Préférences"
$_Text{18}:="Utilisateurs"
$_Text{19}:=""
$_Text{20}:="Nom"
$_Text{21}:="N°"
$_Text{22}:="Visible"
$_Text{23}:="Icône"
$_Text{24}:=""
$_Text{25}:="Supprimé"
$_Text{26}:=""
$_Text{27}:=""
$_Text{28}:=""
$_Text{29}:=""
$_Text{30}:="Liste"
$_Text{31}:="Autre"
$_Text{32}:="OK"
$_Text{33}:="Nom :"
$_Text{34}:="Mot de passe :"
$_Text{35}:="Visible dans la liste d'ouverture :"
$_Text{36}:="Parcourir…"
$_Text{37}:="Taille conseillée : 52x52"
$_Text{38}:="Annuler"
$_Text{39}:=""
$_Text{40}:=""
$_Text{41}:=""
$_Text{42}:=""
$_Text{43}:=""
$_Text{44}:=""
$_Text{45}:=""
$_Text{46}:=""
$_Text{47}:=""
$_Text{48}:=""
$_Text{49}:=""
$_Text{50}:=""
$_Text{51}:=""
$_Text{52}:=""
$_Text{53}:=""
$_Text{54}:=""
$_Text{55}:=""
$_Text{56}:=""
$_Text{57}:=""
$_Text{58}:=""
$_Text{59}:=""
$_Text{60}:=""
_O_ARRAY TO STRING LIST:C512($_Text; $Range)

//--------------------------------------------------------------------------------Variable FR str#

ARRAY TEXT:C222($_Text; 10)
$_Text{1}:="Vous êtes actuellement connecté en tant que %1."
$_Text{2}:=""
$_Text{3}:=""
$_Text{4}:=""
$_Text{5}:=""
$_Text{6}:=""
$_Text{7}:=""
$_Text{8}:=""
$_Text{9}:=""
$_Text{10}:=""
_O_ARRAY TO STRING LIST:C512($_Text; $Range+1)

//--------------------------------------------------------------------------------Menus FR str#

ARRAY TEXT:C222($_Text; 30)
$_Text{1}:="Fichier"
$_Text{2}:="Quitter"
$_Text{3}:="Édition"
$_Text{4}:="Annuler Édition"
$_Text{5}:="Répéter"
$_Text{6}:="Couper"
$_Text{7}:="Copier"
$_Text{8}:="Coller"
$_Text{9}:="Effacer"
$_Text{10}:="Tout sélectionner"
$_Text{11}:="Mode"
$_Text{12}:="Structure"
$_Text{13}:="Utilisation"
$_Text{14}:="Menus créés"
$_Text{15}:=""
$_Text{16}:=""
$_Text{17}:=""
$_Text{18}:=""
$_Text{19}:=""
$_Text{20}:=""
$_Text{21}:="Préférences…"
$_Text{22}:="Qui suis-je ?"
$_Text{23}:="Dialogue d'authentification"
$_Text{24}:=""
$_Text{25}:=""
$_Text{26}:=""
$_Text{27}:=""
$_Text{28}:=""
$_Text{29}:=""
$_Text{30}:=""
_O_ARRAY TO STRING LIST:C512($_Text; $Range+2)

//--------------------------------------------------------------------------------Messages FR str#














