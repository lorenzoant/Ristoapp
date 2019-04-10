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
		Data<input name="data" value="" type="date"/><br>
		Ora<input name="ora" value="" type="time"/><br>
		Posti<input name="posti" value="" type="number"/><br>
		Categoria<select name="categoria">
			<option value="1">Asporto</option>
			<option value="2">Consegna a casa</option>
			<option value="3">Al ristorante</option>
		</select>
		<input name="whatsend" value="creaprenotazione" type="hidden">
		<input value="Crea la prenotazione" type="submit">	
	</form>
</body>
</html>