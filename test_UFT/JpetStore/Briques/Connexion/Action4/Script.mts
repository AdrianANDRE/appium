Dim fso, nomFichier, chemin

DataTable("chemin")= "C:\Users\mmalecot\Documents"
nomFichier = "comptes.csv"

Set fso = CreateObject("Scripting.FileSystemObject")

Set f = fso.OpenTextFile(DataTable("chemin") &"\"&nomfichier,1, True)
Set ftemp = fso.OpenTextFile(DataTable("chemin") &"\temp.txt",2, True)


contenu = f.ReadAll
 ftemp.Write contenu

ligne = DataTable("Compte") & "," & DataTable("Prenom")& "," & DataTable("Nom") & "," & DataTable("Mail") & "," & DataTable("motDePasse") & "," & DataTable("derniereConnexion") & "," & DataTable("dateNaissance")
ftemp.WriteLine ligne

f.Close
ftemp.Close

fso.DeleteFile DataTable("chemin") &"\"&nomfichier
fso.MoveFile DataTable("chemin") &"\temp.txt", DataTable("chemin") &"\"&nomfichier

Reporter.ReportEvent micDone, "Stockage données", "Les données ont été stockées dans le fichier " & DataTable("chemin") &"\"& nomfichier

nbFichiers = nb_fichiers_ds_dossier(DataTable("chemin"))

MsgBox "Il y a " & nbFichiers & " dans le dossier."


