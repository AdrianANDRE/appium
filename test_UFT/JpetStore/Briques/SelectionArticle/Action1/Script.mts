Dim  pageProduit, pageAngelFish, pageShoppingCart

Set pageProduit = Browser("JPetStore").Page("Produit")
Set pageAngelFish = Browser("JPetStore").Page("AngelFish")
Set pageShoppingCart = Browser("JPetStore").Page("ShoppingCart")

cliquerElement pageProduit.Link("FI-SW-01")

If VerifVisibiliteElement(pageAngelFish.WebElement("Angelfish"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page AngelFish", "La page produit AngelFish s'est affichée."
Else 
	reporter.ReportEvent micFail, "Affichage page AngelFish", "La page produit AngelFish ne s'est pas affichée."
End If

cliquerElement pageAngelFish.Link("Add to Cart")

If VerifVisibiliteElement(pageShoppingCart.WebElement("Shopping Cart"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page Shopping Cart", "La page Shopping Cart s'est affichée."
Else 
	reporter.ReportEvent micFail, "Affichage page Shopping Cart", "La page Shopping Cart ne s'est pas affichée."
End If


