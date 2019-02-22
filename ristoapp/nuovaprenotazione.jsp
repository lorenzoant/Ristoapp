<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Nuova prenotazione</title>
</head>
<body>
<form action="nuovaprenotazioneservlet" name="nuovaprenotazione" method="POST">
		<input name="tipoprenotazione" value="" type="text"/><br>
		<input name="data" value="" type="date"/><br>
		<input name="ora" value="" type="date"/><br>
		<input name="posti" value="" type="number"/><br>
		<input value="Crea la prenotazione" type="submit">
	</form>
</body>
</html>