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
		Nome piatto <input name="nome" value="" type="text"/><br>
		Breve desrizione <input name="descrizione" value="" type="text"/><br>
		Categoria <input name="categoria" value="" type="text"/><br>
		Prezzo <input name="prezzo" value="" type="text"/><br>
		Disponibile <input name="disponibile" value="" type="checkbox" checked/><br>
		URL http foto <input name="url" value="" type="text"/><br>
		Allergeni <input name="allergeni" value="" type="text"/><br>
		<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
		<input value="Aggiungi piatto al tuo ristorante" type="submit">
	</form>
	<form action="aggiungipiattoservlet" name="salvaneldb" method="post">
		<input name="whatsend" value="salvaneldb" type="hidden"/>
		<input value="Salva nel DB" type="submit">
	</form>
</body>
</html>