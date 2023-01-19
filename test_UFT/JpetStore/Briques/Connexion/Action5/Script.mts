Set oSM = CreateObject("com.sun.star.ServiceManager")
Set oDesk = oSM.createInstance("com.sun.star.frame.Desktop")
Dim arg()

DataTable("chemin")= "file:///C:/Users/mmalecot/Documents"
nomFichier = "DonneesTest.xls"
'sLoadUrl = ConvertToURL(DataTable("chemin") &"/"&nomfichier)
Set wb = oDesk.loadComponentFromURL(DataTable("chemin") &"/"&nomfichier, "_blank", 0, arg)
Set oSheet = wb.CurrentController.ActiveSheet

Randomize
ligne = Int((Rnd*8) + 1) 

'prénom
DataTable("Prenom") = oSheet.getCellByPosition(0,ligne).String

'nom
DataTable("Nom") = oSheet.getCellByPosition(1,ligne).String

'mail
DataTable("Mail") = oSheet.getCellByPosition(2,ligne).String

'date de naissance
DataTable("dateNaissance") = oSheet.getCellByPosition(3,ligne).String

'mot de passe
DataTable("motDePasse") = Left(DataTable("Prenom"), 3) & Right(DataTable("dateNaissance"), 2) & Right(DataTable("Nom"), 3)

If ligne = 2 or ligne = 5 or ligne = 6 or ligne = 8 Then
	Parameter("Titre") = "Madame"
Else 
	Parameter("Titre") = "Monsieur"
End If

wb.save
wb.close(true)

Reporter.ReportEvent micDone, "Récupération données", "Les données suivantes ont été récupérées: " & DataTable("Prenom") & " " & DataTable("Nom") & " " &DataTable("Mail") & " " & DataTable("motDePasse") & " " & DataTable("dateNaissance") 
