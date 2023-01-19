Dim pageAccueil, pageAll, pageProduit

Set pageAccueil = Browser("PrestaTest").page("PrestaTest")

Set pageAll = Browser("PrestaTest").page("Accueil-all")

Set pageProduit = Browser("PrestaTest").page("Coussin renard")

cliquerElement pageAccueil.Link("Tous les produits")

If VerifVisibiliteElement(pageAll.Image("Coussin renard"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page Tous les produits", "La page Tous les produits s'est affichée."
Else 
	reporter.ReportEvent micFail, "Affichage page Tous les produits", "La page Tous les produits ne s'est pas affichée."
End If

cliquerElement pageAll.Image("Coussin renard")

If VerifVisibiliteElement(pageProduit.WebElement("Coussin déhoussable avec"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page Coussin", "La page produit du coussin s'est affichée."
Else 
	reporter.ReportEvent micFail, "Affichage page Coussin", "La page produit du coussin ne s'est pas affichée."
End If

reporter.ReportEvent micDone, "Attente", "Attente de 10 secondes sur la page Coussin"

wait(10)

cliquerElement pageProduit.WebElement("Accueil")

etat = VerifVisibiliteElement(pageAccueil.WebList("Conteneur carrousel"), "Passant")
If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page accueil", "La page d'accueil s'est affichée."
Else
	reporter.ReportEvent micFail, "Affichage page accueil", "La page d'accueil ne s'est pas affichée."
End If
