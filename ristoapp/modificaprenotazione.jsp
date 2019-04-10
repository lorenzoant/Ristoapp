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
		Data<input name="data" value="" type="date"/><br>
		Ora<input name="ora" value="" type="time"/><br>
		Posti<input name="posti" value="" type="number"/><br>
		Categoria<select name="categoria">
			<option value="1">Asporto</option>
			<option value="2">Consegna a casa</option>
			<option value="3">Al ristorante</option>
		</select>
		<input name="whatsend" value="modificaprenotazione" type="hidden">
		<input value="Modifica la prenotazione" type="submit">	
	</form>
</body>
</html>
