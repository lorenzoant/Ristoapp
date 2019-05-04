	<%@page import="ristoapp.bean.ClientiBean"%>
	<%@page import="java.util.concurrent.TimeUnit" %>
	
	

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta charset="ISO-8859-1">
	<title>Mappa</title>
	<%@include file="graphicspuntoacca.jsp"%>
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 80% }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7J1zsErb9_7jxNu5KU5kIENFObAQEbl0&sensor=false">
    </script>
   
  </head>
  <body onload="initialize()">
  
	<div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
						<td align="left"><a href="ilmioristorante.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle">Mappa</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
		</header> 
		
		<script>
		 function initialize() {
		        var mapOptions = {
		          center: new google.maps.LatLng(45.9441565, 8.5571177),
		          zoom: 8
		        };
		        map = new google.maps.Map(document.getElementById("demo"),
		            mapOptions);
		      }
		      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
   <div id="demo"></div>
  </body>
</html>