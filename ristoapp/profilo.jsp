<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Utente</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<% 
	
	// Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato

	
	
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome(); //nome del profilo
	
  		if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
</head>
		

<body>
<center>
	<div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
					<td align="left"><a href="bacheca.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
						<td align="center" style="width:100%">
						
							<h2 style="display: inline;vertical-align:middle"> <%=nomeLoggato %>  benvenuto nel tuo account</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
		</header>
		</div>
		</center>
		<br><br><br><br><br><br><br>
		<center>
	<table>
		<tr>
		<td>
<!--                     CARTA PROFILO                         -->
				<style>
				.demo-card-square.mdl-card {
				  width: 320px;
				  height: 320px;
				}
				.demo-card-square > .mdl-card__title {
				  color: red;
				 
				  background-color: #f22202;
				}
				</style>
				
				<div class="demo-card-square mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__title mdl-card--expand">
				    <h2 class="mdl-card__title-text"> Profilo</h2>
				  </div>
				  <div class="mdl-card__supporting-text">
				 	Se entrarai in questa cards avrai tutte le funzionalità per poter
				 	avere in futuro un'esperienza del tutto  personalizzata.
				 	
				  </div>
				  <div class="mdl-card__actions mdl-card--border">
				    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="modificaaccount.jsp">
				      Modifica
				    </a>
				  </div>
				</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
			
			
<!--                      PRENOTAZIONI                           -->
				<style>
				.demo-card-square.mdl-card {
				  width: 320px;
				  height: 320px;
				}
				.demo-card-square > .mdl-card__title {
				  color: #fff;
				  background:
				    url('../assets/demos/dog.png') bottom right 15% no-repeat #46B6AC;
				}
				</style>
				
				
				<div class="demo-card-square mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__title mdl-card--expand">
				    <h2 class="mdl-card__title-text"> Prenotazioni</h2>
				  </div>
				  <div class="mdl-card__supporting-text">
				   Nel caso avessi prenotato, ma sfortunatamente non puoi presenterarti
				   questa cards è quella che fa al caso tuo.
				  </div>
				  <div class="mdl-card__actions mdl-card--border">
				    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="modificaprenotazione.jsp">
				      Modifica
				    </a>
				  </div>
				</div>
				</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<td>
				<!--                      CARTE                           -->
				<style>
				.demo-card-square.mdl-card {
				  width: 320px;
				  height: 320px;
				}
				.demo-card-square > .mdl-card__title {
				  color: #fff;
				  background:
				    url('../assets/demos/dog.png') bottom right 15% no-repeat #46B6AC;
				}
				</style>
				
				
				<div class="demo-card-square mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__title mdl-card--expand">
				    <h2 class="mdl-card__title-text">Opzioni di Pagamento </h2>
				  </div>
				  <div class="mdl-card__supporting-text">
				   Modifica tutte le impostazioni e le carte relative alle opzioni di pagamento
				   online.
				  </div>
				  <div class="mdl-card__actions mdl-card--border">
				    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="modificaprenotazione.jsp">
				      Modifica
				    </a>
				  </div>
				</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
				<!--                      ZONA                           -->
				<style>
				.demo-card-square.mdl-card {
				  width: 320px;
				  height: 320px;
				}
				.demo-card-square > .mdl-card__title {
				  color: #fff;
				  background:
				    url('../assets/demos/dog.png') bottom right 15% no-repeat #46B6AC;
				}
				</style>
				
				
				<div class="demo-card-square mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__title mdl-card--expand">
				    <h2 class="mdl-card__title-text">Dove si mangia?</h2>
				  </div>
				  <div class="mdl-card__supporting-text">
				   Se non puoi o non vuoi spostarti più di tanto per mangiare
				   questa opzione fa per te.
				  </div>
				  <div class="mdl-card__actions mdl-card--border">
				    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="mappa2.jsp">
				      Guarda
				    </a>
				  </div>
				</div>
				</td>
			
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
		
	</table>
	</center>
</body>
</html>

