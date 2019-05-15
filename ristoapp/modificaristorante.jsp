<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.RistorantiBean"%>
<%@page import="ristoapp.bean.ClientiBean"%>

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
   
<%
		RistorantiBean ristorante = new RistorantiBean();
		
		//prendo i dati del ristorante dalla sessione
		ristorante = (RistorantiBean) request.getSession().getAttribute("RISTORANTELOGGATO");	
		
		boolean presenza = false;
		boolean climatizzazione = true;
		boolean animali = true;
		boolean wifi = true;
		boolean disabili = true;
		boolean parcheggio = true;
		int IDFCatCucina = 0;
		String Nome = "";
		double CoordinataLat = 0;
		double CoordinataLon = 0;
		String Indirizzo = "";
		String Telefono = "";
		String Email = "";
		String Comune = "";
		String Descrizione = "";
		int NumeroPosti = 0;
		String url="";
		
		
		//setto le variabili con i dati da sessione
		if (ristorante != null) {
			presenza = true;
			
			if(ristorante.getSerClimatizzazione() == false) climatizzazione = false;
			if(ristorante.getSerAnimali() == false) animali = false;
			if(ristorante.getSerWifi() == false) wifi = false;
			if(ristorante.getSerDisabili() == false) disabili = false;
			if(ristorante.getSerParcheggio() == false) parcheggio = false;
			IDFCatCucina = ristorante.getIDFCatCucina();
			Nome = ristorante.getNome();
			CoordinataLat = ristorante.getCoordinataLat();
			CoordinataLon = ristorante.getCoordinataLon();
			Indirizzo = ristorante.getIndirizzo();
			Telefono = ristorante.getTelefono();
			Email = ristorante.getEmail();
			Comune = ristorante.getComune();
			Descrizione = ristorante.getDescrizione();
			NumeroPosti = ristorante.getNumeroPosti();
			url = ristorante.getUrl();
			
		}
	


%>   

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica ristorante</title>
	<!-- By Albertini -->
	<%@include file="graphicspuntoacca.jsp"%>
	
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
<body class="text-center" onload="getStreetLatLon(); imaggineprofilo();">
	
	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="ilmioristorante.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Modifica ristorante</h2>
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
				<input class="mdl-textfield__input" type = "text" name = "nome_ristorante" id="NomeRisto" maxlength="30" value="<%= Nome %>" required/>
				<label class="mdl-textfield__label" for="NomeRisto">Nome Ristorante</label>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<select class="mdl-textfield__input" id="categoria" name="categoria" required>
				<option value="" disabled selected></option>
						<% 
	
						Connection con = null;
						ResultSet query = null;
						
						try{
							// Stabilisco la connessione con il database
							con = SaveMySQL.getDBConnection();
							
						    PreparedStatement pst = con.prepareStatement("SELECT * FROM CategoriaCucina;");
						    query=pst.executeQuery();
						    
						     while(query.next()){ // Scorro le righe
						          String id = query.getString("IDCatCucina");
						          String name = query.getString("Nome");
						          if (Integer.parseInt(id) != IDFCatCucina){
						%>
						<option value="<%=id%>"><%=name%></option>
						<%
						          }else{
			  	    	 %>
						<option value="<%=id%>" selected><%=name%></option>
						<%
						          }
						     }
						}
						catch(Exception e){    
							System.out.println(e.getMessage());
						}
						%>
						</select>
				<label class="mdl-textfield__label" for="categoria">Categoria</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="telefono" id="Telefono" maxlength="10" value="<%= Telefono %>" required>
				<label class="mdl-textfield__label" for="Telefono">Telefono</label>
				<span class="mdl-textfield__error">Input is not a number!</span>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label id="Email" >	 
				<input class="mdl-textfield__input" type = "text" name = "email" maxlength="45" value="<%= Email %>" required/>	
				<label class="mdl-textfield__label" for="Email">Email</label>
			</div><br>		
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<select class="mdl-textfield__input" id="comuni" name="comuni" onfocusout="getStreetLatLon();" required>
				<option value="" disabled selected></option>
						<% 
	
						Connection conn = null;
						ResultSet rs = null;
						
						try{
							// Stabilisco la connessione con il database
							conn = SaveMySQL.getDBConnection();
							
						    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Comuni;");
						    rs=pst.executeQuery();
						   
						     while(rs.next()){ // Scorro le righe
						          String name = rs.getString("Nome");
								  if (name.equalsIgnoreCase(Comune)){
						%>
						<option value="<%=name%>" selected><%=name%></option>
						<%
								  }else{
						%>
						<option value="<%=name%>"><%=name%></option>
						<%
								  }
						     }
						}
						catch(Exception e){    
							System.out.println(e.getMessage());
						}
						%>
						</select>
				<label class="mdl-textfield__label" for="comuni">Comuni</label>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name="indirizzo" id="indirizzo" value="<%= Indirizzo %>" required onfocusout="getStreetLatLon();"/>
				<label class="mdl-textfield__label" for="Indirizzo">Indirizzo</label>
			</div>
			<br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" id="lat" type="text" name="latitudine" value="<%= CoordinataLat %>"/>
				<label class="mdl-textfield__label" for="lat"></label>
			</div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" id="lon" type="text" name="longitudine" value="<%= CoordinataLon %>"/>
				<label class="mdl-textfield__label" for="lon"></label>
			</div>
	       
		   <div id="map" class="mappa" style=""></div>
		   
	       <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name="posti" id="Posti" value="<%= NumeroPosti %>" required>
				<label class="mdl-textfield__label" for="Posti">Posti</label>
				<span class="mdl-textfield__error">Input is not a number!</span>
			</div>	
	 			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="url" name="url"  value="<%= url %>" required onfocusout="imaggineprofilo();">
			    <label class="mdl-textfield__label" for="url">URL http foto</label>
	  		</div>
	  		
	  		<img style="width: 150px; height: 150px;" id="foto" src="http://www.gifanimate.com/data/media/92/cuoco-chef-immagine-animata-0019.gif" alt="Foto">
	  		
	  		<br>
			 
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			  	<textarea class="mdl-textfield__input" type="text" rows= "2" id="AreaDescrizione" name="descrizione"><%= Descrizione %></textarea>
			    <label class="mdl-textfield__label" for="AreaDescrizione">Descrizione...</label>
			 </div><br>
			
			<!-- ---------------------------------------CHECKBOX--------------------------------------------------- -->
			
			<table>		
				<tr>
					<td>
					<%if (climatizzazione == true){%>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
					  <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" name="ser-climatizzazione" checked>
					  <span class="mdl-checkbox__label">Ser-Climatizzazione</span>
					</label>
					<%}else{ %>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
					  <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" name="ser-climatizzazione">
					  <span class="mdl-checkbox__label">Ser-Climatizzazione</span>
					</label>
					<%} %>
					</td>
				
					<td>
					<%if (animali == true){%>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
					  <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input" name="ser-animali" checked>
					  <span class="mdl-checkbox__label">Ser-Animali</span>
					</label>
					<%}else{ %>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
					  <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input" name="ser-animali">
					  <span class="mdl-checkbox__label">Ser-Animali</span>
					</label>
					<%} %>
					</td>
				</tr>
				<tr>
					<td>
					<%if (wifi == true){%>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-3">
					  <input type="checkbox" id="checkbox-3" class="mdl-checkbox__input" name="ser-wifi" checked>
					  <span class="mdl-checkbox__label">Ser-Wifi</span>
					</label>
					<%}else{ %>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-3">
					  <input type="checkbox" id="checkbox-3" class="mdl-checkbox__input" name="ser-wifi">
					  <span class="mdl-checkbox__label">Ser-Wifi</span>
					</label>
					<%} %>
					</td>
					
					<td>
					<%if (disabili == true){%>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-4">
					  <input type="checkbox" id="checkbox-4" class="mdl-checkbox__input" name="ser-disabili" checked>
					  <span class="mdl-checkbox__label">Ser-Disabili</span>
					</label>
					<%}else{ %>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-4">
					  <input type="checkbox" id="checkbox-4" class="mdl-checkbox__input" name="ser-disabili">
					  <span class="mdl-checkbox__label">Ser-Disabili</span>
					</label>
					<%} %>
					</td>
				</tr>
				<tr>
					<td>
					<%if (parcheggio == true){%>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-5">
					  <input type="checkbox" id="checkbox-5" class="mdl-checkbox__input" name="ser-parcheggio" checked>
					  <span class="mdl-checkbox__label">Ser-Parcheggio</span>
					</label>
					<%}else{ %>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-5">
					  <input type="checkbox" id="checkbox-5" class="mdl-checkbox__input" name="ser-parcheggio">
					  <span class="mdl-checkbox__label">Ser-Parcheggio</span>
					</label>
					<%} %>
					</td>
					<td>
					<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
					  <input type="checkbox" class="mdl-checkbox__input" disabled>
					  <span class="mdl-checkbox__label">Ser-Tavolo</span>
					</label>
					</td>
				</tr>
			</table>
			<br><br><br>
			
			<input name="whatsend" value="modificaristorante" type="hidden"/>	
	
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Salva modifiche"/><br>
		</form>
		
		<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
		  <div class="mdl-snackbar__text"></div>
		  <button class="mdl-snackbar__action" type="button"></button>
		</div>
		
	</div>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5JYM6YP2B7egPqgDN7t7RvaK4QMTyS9w&callback=myMap"></script>

</body>
</html>