<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.ClientiBean"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registrazione ristoratore</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
  		if(cli.getLivAutorizzazioni() != 1){
  			// L'utente non è un ristoratore
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}
%>

	<script>
	function myMap() {
		var myCenter = new google.maps.LatLng(document.getElementById("lat").value, document.getElementById("lon").value);
		var mapCanvas = document.getElementById("map");
		var mapOptions;
		if(document.getElementById("lat").value != "" && document.getElementById("lon").value != ""){
			mapOptions = {center: myCenter, zoom: 10};
		}else {
			mapOptions = {center: myCenter, zoom: 1};
		}
		var map = new google.maps.Map(mapCanvas, mapOptions);
		if(document.getElementById("lat").value != "" && document.getElementById("lon").value != ""){
			var marker = new google.maps.Marker({position:myCenter, icon:'MEDIA/pinkball.png'});
			marker.setMap(map);
		}
	
		var infowindow = new google.maps.InfoWindow({
		  content:"Hello World!"
		});
	
		google.maps.event.addListener(marker, 'click', function() {
		  infowindow.open(map,marker);
		});
		
		// Zoom to 18 when clicking on marker
		google.maps.event.addListener(marker,'click',function() {
		  map.setZoom(18);
		  map.setCenter(marker.getPosition());
		});
	
	}
			
	function getStreetLatLon(){
		var streetName = document.getElementById("comuni").value;
		streetName += " " + document.getElementById("indirizzo").value;
		//var streetNumber = document.getElementById("streetNumber").value;
		var streetNumber = "";
		if(streetName == '') return; // Non ho il nome della via -> esco
		
		let url = 'https://nominatim.openstreetmap.org/search?q=' + streetNumber + ' ' + streetName + '&format=json';
	
		fetch(url)
		.then(res => res.json())
		.then((out) => {
		  console.log('Checkout this JSON! ', out);
		  if(out.length == 0){
			//barra di dialogo in caso di immissione errata dell'indirizzo
			var snackbarContainer = document.querySelector('#demo-toast-example');
			snackbarContainer.style.backgroundColor = '#' +
			Math.floor(Math.random() * 0xFFFFFF).toString(16);
			var data = {
			message: 'Indirizzo inesistente',
			timeout: 2000,
			};
			snackbarContainer.MaterialSnackbar.showSnackbar(data);
			
			document.getElementById("lat").value = '';
			document.getElementById("lon").value = '';
			document.getElementById("indirizzo").value = '';
		  }
		  else{
			  document.getElementById("lat").value = out[0].lat;
			  document.getElementById("lon").value = out[0].lon;
			 
			  myMap();
			  
		  }
		})
		.catch(err => {
			// Errore URL
			document.getElementById("lat").value = '';
			document.getElementById("lon").value = '';
			throw err 
		});
	
	}
	
	function informativa(){
		
		var snackbarContainer = document.querySelector('#demo-toast-example');
			snackbarContainer.style.backgroundColor = '#' +
			Math.floor(Math.random() * 0xFFFFFF).toString(16);
			var data = {
			message: 'È obbligatorio accettare per poter completare la registrazione',
			timeout: 3000,
			};
			snackbarContainer.MaterialSnackbar.showSnackbar(data);
		
	}
	
	function imaggineprofilo(){
		var link = document.getElementById("url").value;
		if(link != ""){
			document.getElementById("foto").src = link;
		}else{
			document.getElementById("foto").src = "http://www.gifanimate.com/data/media/92/cuoco-chef-immagine-animata-0019.gif";
		}
	
	}
	</script>
	
	
</head>
<body class="text-center">

	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="login.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Registrazione ristorante</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="page">
	  
	  	<!-- PAGE CONTENT -->
	  	<center>
		<form action = "registratiristoranteservlet" name = "account" method ="post">
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "nome_ristorante" id="NomeRisto" required/>
				<label class="mdl-textfield__label" for="NomeRisto">Nome Ristorante*</label>
			</div>
		
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<select class="mdl-textfield__input" id="categoria" name="categoria" required>
				<option value="" disabled selected></option>
				<% 

				Connection conn = null;
				ResultSet query = null;
				
				try{
					// Stabilisco la connessione con il database
					conn = SaveMySQL.getDBConnection();
					
					PreparedStatement pst = conn.prepareStatement("SELECT * FROM CategoriaCucina;");
					query=pst.executeQuery();
					
					 while(query.next()){ // Scorro le righe
						  String id = query.getString("IDCatCucina");
						  String name = query.getString("Nome");
				%>
				<option value="<%=id%>"><%=name%></option>
				<%
					 }
				}
				catch(Exception e){    
					System.out.println(e.getMessage());
				}
				%>
				</select>
				<label class="mdl-textfield__label" for="categoria">Categoria*</label>
			</div>
			
			<br>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="telefono" id="Telefono" required>
				<label class="mdl-textfield__label" for="Telefono">Telefono*</label>
				<span class="mdl-textfield__error">Input is not a number!</span>
			</div>
		
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label id="Email">	 
				<input class="mdl-textfield__input" type = "text" name = "email" required/>	
				<label class="mdl-textfield__label" for="Email">Email*</label>
			</div>
			<br><br>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<select class="mdl-textfield__input" id="comuni" name="comuni" onfocusout="getStreetLatLon();" required>
				<option value="" disabled selected></option>
				<% 

				Connection con = null;
				ResultSet rs = null;
				
				try{
					// Stabilisco la connessione con il database
					con = SaveMySQL.getDBConnection();
					
					PreparedStatement pst = con.prepareStatement("SELECT * FROM Comuni;");
					rs=pst.executeQuery();
					
					 while(rs.next()){ // Scorro le righe
						  String name = rs.getString("Nome");
				%>
				<option value="<%=name%>"><%=name%></option>
				<%
					 }
				}
				catch(Exception e){    
					System.out.println(e.getMessage());
				}
				%>
				</select>
				<label class="mdl-textfield__label" for="comuni">Comuni*</label>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "indirizzo" id="indirizzo" onfocusout="getStreetLatLon();" required/>
				<label class="mdl-textfield__label" for="Indirizzo">Indirizzo*</label>
			</div>
			<br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" id="lat" type="text" name="latitudine"/>
				<label class="mdl-textfield__label" for="lat"></label>
			</div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" id="lon" type="text" name="longitudine"/>
				<label class="mdl-textfield__label" for="lon"></label>
			</div>
			
			<div id="map" class="mappa" style=""></div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="posti" id="Posti" required>
				<label class="mdl-textfield__label" for="Posti">Posti*</label>
				<span class="mdl-textfield__error">Input is not a number!</span>
			</div>	
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="url" name="url" onfocusout="imaggineprofilo();">
				<label class="mdl-textfield__label" for="url">URL http foto</label>
			</div>
			
			<img style="width: 150px; height: 150px;" id="foto" src="http://www.gifanimate.com/data/media/92/cuoco-chef-immagine-animata-0019.gif" alt="Foto">
			
			<br>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			  <textarea class="mdl-textfield__input" type="text" rows= "2" name="descrizione" id="AreaDescrizione"></textarea>
			   <label class="mdl-textfield__label" for="AreaDescrizione">Descrizione...</label>
			 </div>
					
			<!-- ---------------------------------------CHECKBOX--------------------------------------------------- -->
			<table>		
				<tr>
					<td>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
					  <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" name="ser-climatizzazione">
					  <span class="mdl-checkbox__label">Climatizzazione</span>
					</label>
					</td>
				
					<td>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
					  <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input" name="ser-animali">
					  <span class="mdl-checkbox__label">Ser-Animali</span>
					</label>
					</td>
				</tr>
				<tr>
					<td>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-3">
					  <input type="checkbox" id="checkbox-3" class="mdl-checkbox__input" name="ser-wifi">
					  <span class="mdl-checkbox__label">Ser-Wifi</span>
					</label>
					</td>
					
					<td>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-4">
					  <input type="checkbox" id="checkbox-4" class="mdl-checkbox__input" name="ser-disabili">
					  <span class="mdl-checkbox__label">Ser-Disabili</span>
					</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-5">
					  <input type="checkbox" id="checkbox-5" class="mdl-checkbox__input" name="ser-parcheggio">
					  <span class="mdl-checkbox__label">Ser-Parcheggio</span>
					</label>
					</td>
				</tr>
			</table>
			<br><br>
			<hr align="center" width="60%" size="1" noshade="noshade" color="#D8D8D8" style="visibility:visible" class="separatore">
			
			<div class="obbligatoria">
			<p>L'iscrizione è consentita ai soli utenti maggiorenni. Se sei minorenne chiedi aiuto ad un adulto.
			Cliccando in questa casella confermo di aver letto e di accettare le Condizioni generali di servizio 
			e di aver preso visione dell'informativa su trattamento dei dati personali.</p>
			<br>
			<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
			  <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="1" required>
			  <span class="mdl-radio__label">Acconsento</span>
			</label>
			</div>
			
			<br><br><br>
			<input name="whatsend" value="aggiunginuovoristorante" type="hidden"/>	
				
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Aggiungi ristorante"/><br>
			
			</center>
		</form>
				
		<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
		  <div class="mdl-snackbar__text"></div>
		  <button class="mdl-snackbar__action" type="button"></button>
		</div>
		
	</div>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5JYM6YP2B7egPqgDN7t7RvaK4QMTyS9w&callback=myMap"></script>
														    
</body>
</html>