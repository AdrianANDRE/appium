Dim  pageShoppingCart, pageAccueil

Set pageShoppingCart = Browser("JPetStore").Page("ShoppingCart")
Set pageAccueil = Browser("JPetStore").Page("Accueil")

cliquerElement pageShoppingCart.WebEdit("EST-1")

saisirElement pageShoppingCart.WebEdit("EST-1"), Parameter("quantity")

cliquerElement pageShoppingCart.WebButton("Update Cart")


Dim TotalCost
Dim UnitCost

TotalCost = pageShoppingCart.WebElement("PriceTotal").GetROProperty("innertext")
UnitCost= pageShoppingCart.WebElement("PriceUnit").GetROProperty("innertext")

TC = Replace(TotalCost, "$", "")
TU= Replace(UnitCost, "$", "")
TC1=Replace(TC, ".", ",")
TU1=Replace(TU, ".", ",")

TCd= Cdbl(TC1)
TUd = Cdbl(TU1)
		
	If TCd/TUd = Parameter("quantity") Then
		reporter.ReportEvent micPass, "Prix vérifié", "Le prix est correct"
	Else 
		reporter.ReportEvent micFail, "Prix non vérifé", "Le prix n'est pas correct"
	End If


cliquerElement pageShoppingCart.Link("Sign Out")

If VerifVisibiliteElement(pageAccueil.Link("Sign In"), "Passant") = "OK" Then
	reporter.ReportEvent micPass, "Affichage page Accueil", "Le client s'est bien déconnecté"
Else 
	reporter.ReportEvent micFail, "Affichage page Accueil", "Le client ne s'est pas déconnecté"
End If

'SystemUtil.CloseProcessByName("msedge.exe")
'SystemUtil.CloseProcessByName("firefox.exe")
'SystemUtil.CloseProcessByName("chrome.exe")

