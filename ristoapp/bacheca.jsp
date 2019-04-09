<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	
		ArrayList<RistorantiBean> rist = new ArrayList<RistorantiBean>();
		if(request.getSession(),getAttribute("") != null){
			
		}
%>
    
<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>
	
<!--  div id="p1" class="mdl-progress mdl-js-progress"></div> -->
		
		<script>
		//  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
	    //  this.MaterialProgress.setProgress(44);
	    
		//  });
		</script>
		
		<head>		
			<title>RistoApp-Bacheca </title>
			
			<%@include file="graphicspuntoacca.jsp"%>
			
			<div class="mdl-layout__header">
			
			<center>
					<table>
						<tr>
							<td>
								<h2>RistoApp - Bacheca</h2>
							</td>
							<td>
								<img class="logo" src="MEDIA/logo.png"/>
							</td>
						</tr>
					</center>
					</table>
			</div>
			
		</head>
	
	<body class="text-center" style="background-color: red;">
		
		
		

		<div >	<!-- AGGIUNGO DENTRO I BLOCCI PER I RISTORANTI -->
		
		
		</div>
		<div>
			<!-- API GOOGLE DA METTERE LATO A DESTRA -->
			<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> -->
			<script>
				/* var map;
					function initialize() {
  						 var mapOptions = {
   						 zoom: 8,
   						 center: new google.maps.LatLng(-34.397, 150.644)
 						 };
  						 map = new google.maps.Map(document.getElementById('map-canvas'),
     				     mapOptions);
					}
					google.maps.event.addDomListener(window, 'load', initialize);*/
			</script>
		</div>
	

</body>

    <footer style="background-color: yellow;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <ul class="list-inline text-center">
                        <li>
                            <a href="https://www.instagram.com/therealristoapp/?hl=">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-instagram fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/davide.preatoni.31">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/Lorenzoamt/Ristoapp">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                   <p class="copyright text-muted">Copyright &copy; Preatoni Davide 5AITI 4/02/2019</p>
                </div>
            </div>
        </div>
    </footer>
</html>