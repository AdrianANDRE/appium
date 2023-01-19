Dim nomFichierZip
Dim longueur

longueur = Len(Parameter("NomFichier"))

nomFichierZip = Left(Parameter("NomFichier"), longueur - 4) & ".zip"

zip_fichier Parameter("Chemin") & "\" & nomFichierZip, Parameter("Chemin") & "\" & Parameter("NomFichier")

dezip_fichier Parameter("Chemin") & "\" & nomFichierZip, Parameter("Chemin") & "\dezip"
