<%@page import="ristoapp.bean.ClientiBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	
%>
    
<!DOCTYPE html>

<!-- INIZIO CODICE  -->
	<html>
	<div align="center">


<div style='font-size:8pt;padding:1px;border:solid silver 2px;width:303px; color:#FFD350'''>
<span id='progress1'>#</span>
<span id='progress2'>#</span>
<span id='progress3'>#</span>
<span id='progress4'>#</span>
<span id='progress5'>#</span>
<span id='progress6'>#</span>
<span id='progress7'>#</span>
<span id='progress8'>#</span>
<span id='progress9'>#</span>
<span id='progress10'>#</span>
<span id='progress11'>#</span>
<span id='progress12'>#</span>
<span id='progress13'>#</span>
<span id='progress14'>#</span>
<span id='progress15'>#</span>

</div>

<script language="javascript">
var progressEnd = 15;		// set to number of progress <span>'s.
var progressColor = '#FFD350';	// set to progress bar color
var progressInterval = 250;	// set to time between updates (milli-seconds)

var progressAt = progressEnd;
var progressTimer;
function progress_clear() {
	for (var i = 1; i <= progressEnd; i++) document.getElementById('progress'+i).style.backgroundColor = 'transparent';
	progressAt = 0;
}
function progress_update() {
	progressAt++;
	if (progressAt > progressEnd) progress_clear();
	else document.getElementById('progress'+progressAt).style.backgroundColor = progressColor;
	progressTimer = setTimeout('progress_update()',progressInterval);
}
function progress_stop() {
	clearTimeout(progressTimer);
	progress_clear();
}
progress_update();		// start progress bar

</script>

<!--  div id="p1" class="mdl-progress mdl-js-progress"></div> -->
		
		<script>
		//  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
	//	    this.MaterialProgress.setProgress(44);
		//  });
		</script>
		<head>
		
			<title>RistoApp-Bacheca</title>
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
	
	<body class="text-center">
		
		
		<center>

		<div>
		<!-- AGGIUNGO DENTRO I BLOCCI PER I RISTORANTI -->
		
		</div>
		<div>
			<!-- API GOOGLE DA METTERE LATO A DESTRA -->
			<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
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
		</center>

</body>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <ul class="list-inline text-center">
                        <li>
                            <a href="https://www.instagram.com/davide_preatoni/?hl=">
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
                            <a href="https://github.com/davidepreatoni1">
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