Dim pageAccueil
Dim pageLogin
Dim etat

Set pageAccueil = Browser("JpetStore").Page("Accueil")
Set pageLogIn = Browser("JpetStore").Page("LogIn")

cliquerElement pageAccueil.Link("Sign In")

etat = VerifVisibiliteElement(pageLogIn.WebElement("text_login"), "Passant")
If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page login", "La page login s'est affichée."
Else
	reporter.ReportEvent micFail, "Affichage page login", "La page login ne s'est pasaffichée."
End If

saisirElement pageLogIn.WebEdit("username"), Parameter("DS_username")

saisirElement pageLogIn.WebEdit("password"), Parameter("DS_password")

cliquerElement pageLogIn.WebButton("Login")

etat = VerifVisibiliteElement(pageAccueil.Link("Sign Out"), "Passant")
If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page accueil", "Je suis bien connecté"
Else
	reporter.ReportEvent micFail, "Affichage page accueil", "Je ne suis pas connecté"
End If


