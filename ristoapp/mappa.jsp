	<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
	<%@page import="ristoapp.bean.ClientiBean"%>
	<%@page import="ristoapp.bean.RistorantiBean" %>
	<%@page import="java.util.concurrent.TimeUnit" %> 
	<%@page import="ristoapp.db.SaveMySQL" %>
	<%@page import="java.util.ArrayList" %>
	
<%//riprendo la session da Login per avere i dati del cliente

		ArrayList<RistorantiBean> rist = new ArrayList <RistorantiBean>(); //oggetto ristorante list
		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti
				
%>
<!DOCTYPE html>
<html>
  <head>
  
    <title>Mappa</title>
    <%@include file="graphicspuntoacca.jsp"%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 80%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
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
		</header>
		
		<% //SO QUANTI RISTORANTI CI SONO DA STAMPARE

				Connection conn = null;
				ResultSet query = null;
				
				try{
					// Stabilisco la connessione con il database
					conn = SaveMySQL.getDBConnection();
					
					PreparedStatement pst = conn.prepareStatement("SELECT COUNT(IDRistorante) FROM Ristoranti;");
					query=pst.executeQuery();
					
				}
				catch(Exception e){    
					System.out.println(e.getMessage());
				}
		%>
		
		<%
				int cont = 0;
				for(RistorantiBean lista:rist){ //PRENDO IL NOME E LA GEO PER METTERE NELLA MAPPA
					RistorantiBean risto = new RistorantiBean();
					
					risto.setNome(lista.getNome());
					risto.setCoordinataLat(lista.getCoordinataLat());
					risto.setCoordinataLon(lista.getCoordinataLon());
					cont++;
			
			%>
    <div id="map"></div>
    
    
   <script type="text/javascript">
 
    var locations = [];
    for(var i=0; i< <%=query%>; i++) {
        locations[i] = new Array(3);
    }
   
	locations[<%=cont%>] = [<%=risto.getNome()%>,<%=risto.getCoordinataLat()%>,<%=risto.getCoordinataLon()%>];
	</script>
	<%}%
				
	<script>
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(45.4642700, 9.1895100),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    for (i = 0; i < locations.length; i++) {  
		marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });
	marker = new google.maps.Merker({position: new google.maps.LatLng(locations[i][1],locations[i][2]),map:map});
   

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
 <%} %>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5JYM6YP2B7egPqgDN7t7RvaK4QMTyS9w&callback=initMap">
    </script>
  </body>
</html>