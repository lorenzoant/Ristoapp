<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aggiungi piatto</title>
</head>
<body>
	<form action="/ristoapp.servlet/RistoAppServlet" name="aggiungipiatto" method="post">
		Nome piatto <input name="nome" value="" type="text"/><br>
		Prezzo <input name="prezzo" value="" type="text"/><br>
		Breve desrizione <input name="descrizione" value="" type="text"/><br>
		URL foto <input name="url" value="" type="text"/><br>
		Allergeni <input name="allergeni" value="" type="text"/><br>
		<input value="Aggiungi piatto al tuo ristorante" type="submit">
	</form>
</body>
</html>