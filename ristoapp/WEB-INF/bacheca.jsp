<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bacheca</title>
</head>
<body>

<form action = "Bachecaservlet" name = "bacheca" method ="POST">
	
	barra di ricerca <input type="text" name="riceerca"><br>
	
	<!-- filtri per la ricerca: localizzazione, comune, serClimatizzato, serAnimali, wifi, disabili, parcheggio  -->
	<input type="radio" name="vicinanze">
	
	<!-- fare la combobox in jsp per caricare dal db -->
	<select>
		<option>Verbania</option>
		<option>Milano</option>
		<option>Torino</option>
		<option>Roma</option>
		<option>Napoli</option>
	</select>
	
	<input type="radio" name="climatizzazione">
	<input type="radio" name="animali">
	<input type="radio" name="wifi">
	<input type="radio" name="disabili">
	<input type="radio" name="parcheggio">
	
	<input type="submit" name="botto">	<br>
	
	
</form>
</body>
</html>