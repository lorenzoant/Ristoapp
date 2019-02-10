<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registrati</title>
</head>
<body>

<form action = "registratiservlet" name = "account" method ="post">
	Username<input type = "text" name = "username"/><br>
	Password<input type = "text" name = "password"/><br>
	Re_Password<input type = "text" name = "re_password"/><br>
	Nome<input type = "text" name = "nome"/><br>
	Cognome<input type = "text" name = "cognome"/><br>
	Indirizzo<input type = "text" name = "indirizzo"/><br>
	Comune<input type = "text" name = "comune"/><br>
	Lingua<input type = "text" name = "lingua"/><br>
	Notifica_Email<input type = "checkbox" name = "Notifica_email"/><br>
	Geolocalizzazione<input type = "checkbox" name = "geolocalizzazione"/><br>
	<input type = "submit" value = "Registrati"/>
</form>

</html>