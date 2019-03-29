<%@page import="ristoapp.bean.ClientiBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	
%>
    
<!DOCTYPE html>

<!-- INIZIO CODICE  -->
	<html>
		<head>
			<title>RistoApp</title>
			<!-- API GOOGLE -->
			<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
			<script>
				var map;
					function initialize() {
  						 var mapOptions = {
   						 zoom: 8,
   						 center: new google.maps.LatLng(-34.397, 150.644)
 						 };
  						 map = new google.maps.Map(document.getElementById('map-canvas'),
     				     mapOptions);
					}
					google.maps.event.addDomListener(window, 'load', initialize);
			</script>
		</head>
	
	<body>

	<!-- BARRA DI CARICAMENTO -->
	<div id="p1" class="mdl-progress mdl-js-progress"></div>
	
	<script>
	  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
	    this.MaterialProgress.setProgress(44);
	  });
	</script>
	
	<input type="submit" value="submit" name="bottoneprofilo">
			<!-- FACCIO IL REDIRECT A FRIGGI PER LA MODIFICA UTENTE -->
			<!--  <a href="/Ristoapp/BachecaServlet?whatsend=homepage" target="_TOP">HOME PAGE</a>&nbsp; -->
			<%			%>
	<!-- RICERCA DEI DATI NELLA BACHECA -->
	<form action="#">
	  <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
	    <label class="mdl-button mdl-js-button mdl-button--icon" for="sample6">
	      <i class="material-icons">Ricerca</i>
	    </label>
	    <div class="mdl-textfield__expandable-holder">
	      <input class="mdl-textfield__input" type="text" id="sample6">
	      <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
	    </div>
	  </div>
	</form>
	<div id="map-canvas" style="height:300px; width:500px"></div>
	<form action = "bachecaservlet" name = "bacheca" method ="POST">
	
	barra di ricerca <input type="text" name="ricerca"><br>
	
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