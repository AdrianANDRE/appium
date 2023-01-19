Dim pageAccueil, pageConnexion

Set pageAccueil = Browser("PrestaTest").Page("PrestaTest")

Set pageConnexion = Browser("PrestaTest").Page("Compte")

cliquerElement pageAccueil.WebElement("Connexion")

etat = VerifVisibiliteElement(pageConnexion.WebElement("Connectez-vous à votre"), "Passant")

If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page connexion", "La page de connexion s'est affichée."
Else
	reporter.ReportEvent micFail, "Affichage page connexion", "La page de connexion ne s'est pas affichée."
End If

cliquerElement pageConnexion.Link("Pas de compte ? Créez-en")

etat = VerifVisibiliteElement(pageConnexion.WebElement("Créez votre compte"), "Passant")

If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page création compte", "La page de création de compte s'est affichée."
Else
	reporter.ReportEvent micFail, "Affichage page création compte", "La page de création de compte ne s'est pas affichée."
End If

If Parameter("Titre") = "Monsieur" Then
	titre = "1"
ElseIf Parameter("Titre") = "Madame" Then
	titre = "2"
End If

selectionnerElementListe pageConnexion.WebRadioGroup("titre"), titre

saisirElement pageConnexion.WebEdit("firstname"), Parameter("Prenom")

saisirElement pageConnexion.WebEdit("lastname"), Parameter("Nom")

saisirElement pageConnexion.WebEdit("email"), Parameter("email")

saisirElement pageConnexion.WebEdit("Saisie d'un mot de passe"), Parameter("motDePasse")

saisirElement pageConnexion.WebEdit("birthday"), Parameter("dateNaissance")

If Parameter("offres") Then
	cliquerElement pageConnexion.WebCheckBox("optin")
End If

cliquerElement pageConnexion.WebCheckBox("customer_privacy")

If Parameter("newsletter") Then
	cliquerElement pageConnexion.WebCheckBox("newsletter")
End If

cliquerElement pageConnexion.WebCheckBox("psgdpr")

cliquerElement pageConnexion.WebButton("Enregistrer")

requete = "SELECT firstname FROM ps_customer where email = '" & Parameter("email") & "'"

DbTable("CustomerMail").SetTOProperty "source", requete

DbTable("CustomerMail").Check CheckPoint("CustomerMail")

requete = "SELECT * FROM ps_customer where email = '" & Parameter("email") & "'"

DbTable("Comptes").SetTOProperty "source", requete

DbTable("Comptes").Output CheckPoint("Comptes")



