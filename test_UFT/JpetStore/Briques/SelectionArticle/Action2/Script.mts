Dim pageAccueil, pageProduit

Set pageAccueil =  Browser("JpetStore").Page("Accueil")
Set pageProduit = Browser("JPetStore").Page("Produit")
Set pageAngelFish = Browser("JPetStore").Page("AngelFish")

cliquerElement pageAccueil.Image("fish_icon")

If VerifVisibiliteElement(pageProduit.WebElement("Fish"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page Fish", "La page produit Fish s'est affichée."
Else 
	reporter.ReportEvent micFail, "Affichage page Fish", "La page produit Fish ne s'est pas affichée."
End If

