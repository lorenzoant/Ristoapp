<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
			<meta name="viewport" content="width=device-width">
			<title>Mappa </title>

			<%@include file="graphicspuntoacca.jsp"%>

			<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Mappa</h2>
								</td>
								<td>
									<img class="logo" src="MEDIA/logo.png"/>
								</td>
							</tr>
						</table>
				</center>
			</div>

		</head>
<body>
<div>
			<!-- API GOOGLE DA METTERE LATO A DESTRA -->
			
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
		</div>
</body>
</html>