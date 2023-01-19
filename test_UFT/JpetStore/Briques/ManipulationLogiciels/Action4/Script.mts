If Right(Parameter("CheminFichierAComparer"), 3)= "ods" or Right(Parameter("CheminFichierAComparer"), 3)= "xls" or  Right(Parameter("CheminFichierAComparer"), 4)= "xlsx" Then
	ExcelWorksheetCompare Parameter("CheminFichierRef"), Parameter("FeuilleAComparer"), Parameter("CheminFichierAComparer"), Parameter("FeuilleAComparer")
Else
	File2Compare Parameter("CheminFichierRef"), Parameter("CheminFichierAComparer"), "C:\Users\mmalecot\Documents\resultatComparaison.txt"
End If


