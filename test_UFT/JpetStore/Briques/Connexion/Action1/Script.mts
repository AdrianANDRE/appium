Dim cheminBrowser
Dim pageAccueil
Dim etat

Set pageAccueil = Browser("JpetStore").Page("Accueil")

Select Case lcase(Parameter("DS_browser"))
	Case "firefox"
		cheminBrowser = "C:\Program Files\Mozilla Firefox\firefox.exe"
	Case "edge"
		cheminBrowser = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
	Case "chrome"
		cheminBrowser = "C:\Program Files\Google\Chrome\Application\chrome.exe"
	Case else
		Reporter.ReportEvent micFail, "Navigateur", "Le navigateur " & Parameter("DS_browser") & " n'est pas configuré."
End Select

'SystemUtil.CloseProcessByName("msedge.exe")
'SystemUtil.CloseProcessByName("firefox.exe")
'SystemUtil.CloseProcessByName("chrome.exe")

SystemUtil.Run cheminBrowser, "https://petstore.octoperf.com/actions/Catalog.action"

'etat = VerifVisibiliteElement(pageAccueil.Image("PrestaTest"), "Passant")
etat = VerifVisibiliteElement(pageAccueil.Image("image_JpetStore"), "Passant")
If etat = "OK" Then
	reporter.ReportEvent micPass, "Affichage page accueil", "La page d'accueil s'est affichée."
Else
	reporter.ReportEvent micFail, "Affichage page accueil", "La page d'accueil ne s'est pasaffichée."
End If
