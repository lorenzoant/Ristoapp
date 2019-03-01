<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
</head>
<body>
	<form action="aggiungipiattoservlet" name="aggiungipiatto" method="post">
		Nome piatto <input name="nome" value="" type="text" required/><br>
		Breve desrizione <input name="descrizione" value="" type="text" required/><br>
		Categoria <input name="categoria" value="" type="text" required/><br>
		Prezzo <input name="prezzo" value="" type="number" step="0.01" required/><br>
		Disponibile <input name="disponibile" value="" type="checkbox" checked/><br>
		URL http foto <input name="url" value="" type="text"required/><br>
		Allergeni <input name="allergeni" value="" type="text"/><br>
		<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
		<input value="Aggiungi piatto al tuo ristorante" type="submit">
		<br>DEBUG: In questo momento il piatto viene inserito nel database senza associare il ristorante al piatto.
		<br>La categoria è da sistemare.
	</form>
</body>
</html>