<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica account</title>
</head>
<body>

<form action = "modificaaccountservlet" name = "modificaaccount" method ="post">
	Nome<input type = "text" name = "nome"/><br>
	Cognome<input type = "text" name = "cognome"/><br>
	Indirizzo<input type = "text" name = "indirizzo"/><br>
	Comune<input type = "text" name = "comune"/><br>
	Email<input type = "text" name = "email"/><br>
	Password<input type = "text" name = "password"/><br>
	Notifica_Email<input type = "checkbox" name = "Notifica_email"/><br>
	Geolocalizzazione<input type = "checkbox" name = "geolocalizzazione"/><br>
	<input type = "button" value = "Cronologia Pagamenti"/>
	<input type = "submit" value = "Salva ed Esci"/>
</form>

</html>