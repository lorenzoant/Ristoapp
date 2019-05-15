	<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
	<%@page import="ristoapp.db.SaveMySQL" %>
	<%@page import="ristoapp.bean.ClientiBean"%>
	
<!DOCTYPE html>
<html>
  <head>
  
    <title>Mappa</title>
    <!-- By Albertini -->
    <%@include file="graphicspuntoacca.jsp"%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
  	%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
  </head>
  <body onload="getLocation();">
  <div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
						<td align="left"><a href="bacheca.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle">Mappa</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
			
			<% //SO QUANTI RISTORANTI CI SONO DA STAMPARE

				Connection conn = null;
				ResultSet rs = null;
				
				try{
					// Stabilisco la connessione con il database
					conn = SaveMySQL.getDBConnection();
					
					PreparedStatement pst = conn.prepareStatement("SELECT * FROM Ristoranti;");
					rs = pst.executeQuery();
					
				}
				catch(Exception e){    
					System.out.println(e.getMessage());
				}
				
				String nome = "";
				String lat = "";
				String lon = "";
				String comune = "";
				%>	
				
		   <script>  
				//var x = document.getElementById("map");
				var latitudine = 0;
				var longitudine = 0;
				
				function getLocation() {
				  if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(showPosition);
				  }
				}

				function showPosition(position) {
				  latitudine = position.coords.latitude;
				  longitudine = position.coords.longitude;
				  
				  initMap();

				}
	
				function initMap() {
				var map = new google.maps.Map(document.getElementById('map'), {
						zoom: 13,
						center: new google.maps.LatLng(latitudine, longitudine),
						mapTypeId: google.maps.MapTypeId.ROADMAP
					  });
				var locations = [['<span style="font-weight: bold">You</span>', latitudine, longitudine],
				<%
				while(rs.next()){ // Scorro le righe
					nome = rs.getString("Nome");
					lat = rs.getString("CoordinataLat");
					lon = rs.getString("CoordinataLon");
					comune = rs.getString("Comune");
					System.out.println(nome);
				%>
				
					
					
					['<span style="font-weight: bold"><%=nome%></span>, <%=comune%>', <%=lat%>, <%=lon%>],
				  	
				
				<%}%>];
				  
				    var infowindow = new google.maps.InfoWindow();
  
				    var marker, i;
				    var icons = [];
					icons[0] = 'MEDIA/point.png';
			  	
					for (i = 1; i < locations.length; i++) {  
						icons[i] = 'MEDIA/pinkball.png';
					}
					
					  for (i = 0; i < locations.length; i++) {  
						  marker = new google.maps.Marker({
						  position: new google.maps.LatLng(locations[i][1], locations[i][2]),
						  map: map,
						  icon: icons[i],
						});
						
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
						return function() {
						infowindow.setContent(locations[i][0]);
						infowindow.open(map, marker);
					  }
					})(marker, i));
					  
					}
				}
		  </script>
 
		</header>
		
		
	<div id="map" style="width:100%;height:100%;"></div>
	
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5JYM6YP2B7egPqgDN7t7RvaK4QMTyS9w&callback=initMap">
    </script>
  </body>
</html>