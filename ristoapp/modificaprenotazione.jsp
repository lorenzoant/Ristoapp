<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica prenotazione</title>
</head>
<body>
<form action="modificaprenotazioneservlet" name="modificaprenotazione" method="POST">
		<input name="data" value="" type="date"/><br>
		<input name="ora" value="" type="date"/><br>
		<input name="posti" value="" type="number"/><br>
		<input name="whatsend" value="creaprenotazione" type="hidden">
		<input value="Modifica la prenotazione" type="submit">	
	</form>
</body>
</html>
