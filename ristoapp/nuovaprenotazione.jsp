<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Nuova prenotazione</title>
</head>
<body>
<form action="/nuovaprenotazioneservlet" name="nuovaprenotazione" method="POST">
		<div>Tipo di prenotazione: <input name="tipoprenotazione" value="" type="text"/></div><br>
		<div>Data Prenotazione:    <input name="data" value="" type="date"/></div><br>
		<div>Ora  Prenotazione:    <input name="ora" value="" type="date"/></div><br>
		<div>Posti da prenotare:   <input name="posti" value="" type="number"/></div><br>
		<input value="Crea la prenotazione" type="submit">
	</form>
</body>
</html>