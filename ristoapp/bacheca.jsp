<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	//utente loggato
		ArrayList<RistorantiBean> rist = new ArrayList <>(); //oggetto ristorante
		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti

%>
    
<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>

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
						</table>
				</center>
			</div>

		</head>

	<body class="text-center" style="background-color: red;">

		<%
			for(RistorantiBean lista:rist){

				// int IDRistorante;
				 String NomeCatCucina = lista.getNomeCatCucina();
				 //int IDFCliente;
				 String Nome = lista.getNome(); //nome ristorante
				 //double CoordinataLat;
			     //double CoordinataLon;
				 String Indirizzo = lista.getIndirizzo();
				 String Telefono = lista.getTelefono();
				 String Email = lista.getEmail();
				 String Comune = lista.getComune();
				 String Descrizione = lista.getDescrizione();
				 Boolean SerClimatizzazione = lista.getSerClimatizzazione();
				 Boolean SerAnimali = lista.getSerAnimali();
				 Boolean SerWifi = lista.getSerWifi();
				 Boolean SerDisabili = lista.getSerDisabili();
				 Boolean SerParcheggio = lista.getSerParcheggio();


			%>
			<tr>
				<td><%=%></td>
				<td><%= %></td>
				<td><%= %></td>
			</tr>
			<%
			}
		%>
		</table>


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
