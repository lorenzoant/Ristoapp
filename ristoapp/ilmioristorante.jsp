<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="ristoapp.bean.PiattiBean"%>
<%@page import="ristoapp.bean.RistorantiBean"%>
<%@page import="ristoapp.bean.PrenotazioniBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" CONTENT="60; url=ilmioristorantecaricamento.jsp"> 
	<title>Il mio ristorante</title>
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
	}%>
</head>
<body>

	<div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle">Il mio ristorante</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
		</header>
		<div class="mdl-layout__drawer">
			<h4 style="text-align:center;">Menu</h4><hr>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link" href="ilmioristorantecaricamento.jsp">Riaggiorna</a>
		        <a class="mdl-navigation__link" href="aggiungipiatto.jsp">Aggiungi piatto</a>
		        <a class="mdl-navigation__link" href="">Modifica ristorante [Albertini]</a>
		        <a class="mdl-navigation__link" href="">Modifica account [Frigerio]</a>
			    <hr>
			    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
		  	</nav>
		</div>
		
		
	  	<div class="mdl-layout__content page">
	  
	  	<!-- PAGE CONTENT -->
	  	<h3>Ciao <%=nomeLoggato%>, ecco le prenotazioni di oggi</h3>
	  	<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		<thead>
			<tr>
				<th>Data</th>
				<th>Ora</th>
				<th>Persone</th>
				<th>Stato pagamento</th>
				<th>IDF cliente</th>
				<th>IDF cat prenotazione</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				Date today = Calendar.getInstance().getTime(); 
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String today_str = df.format(today);
				
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PrenotazioniBean> prenotazioni = risto.getPrenotazioni();
				for(PrenotazioniBean p:prenotazioni){
					
					// Scritta per pagato
					String pagatoOut;
					if(p.getStatoPagamento()){
						pagatoOut = "<span style='color:green'>pagato</span>";
					}else{
						pagatoOut = "<span style='color:red'>non pagato</span>";
					}
					
					String catPren = "";
					if(p.getIDFCatPrenotazione() == 1) catPren = "Asporto";
					else if(p.getIDFCatPrenotazione() == 2) catPren = "Consegna a casa";
					else if(p.getIDFCatPrenotazione() == 3) catPren = "Al ristorante";

					if(p.getData().equals(today_str)){%>
						<tr>
						<td><%=p.getData()%></td>
						<td><%=p.getOra()%></td>
						<td><%=p.getNumeroPersone()%></td>
						<td><%=pagatoOut%></td>
						<td><%=p.getIDFCliente()%></td>
						<td><%=catPren%></td>
						<td>
							<form action="visualizzaprenotazione" name="visualizzaDettPrenotazione" method="post">
							<input type="hidden" name="idPrenotazione" value="<%=p.getIDPrenotazione()%>"></input>
							<input type="hidden" name="whatsend" value="visualizzaDettPrenotazione"></input>
							<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="Dettagli"/>
							</form>
						</td>
						</tr>
					<%}
				}
				
			}%>
		</tbody>
		</table>
		</div>
		<br>
		
		
		
		<h3>Tutte le prenotazioni</h3>
		<!--h3>Prenotazioni di questa settimana [Da mettere le date nella query]</h3-->
		<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		<thead>
			<tr>
				<th>Data</th>
				<th>Ora</th>
				<th>Persone</th>
				<th>Stato pagamento</th>
				<th>IDF cliente</th>
				<th>IDF cat prenotazione</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PrenotazioniBean> prenotazioni = risto.getPrenotazioni();
				for(PrenotazioniBean p:prenotazioni){
					
					// Scritta per pagato
					String pagatoOut;
					if(p.getStatoPagamento()){
						pagatoOut = "<span style='color:green'>pagato</span>";
					}else{
						pagatoOut = "<span style='color:red'>non pagato</span>";
					}
					
					String catPren = "";
					if(p.getIDFCatPrenotazione() == 1) catPren = "Asporto";
					else if(p.getIDFCatPrenotazione() == 2) catPren = "Consegna a casa";
					else if(p.getIDFCatPrenotazione() == 3) catPren = "Al ristorante";
					
					%>
					<tr>
					<td><%=p.getData()%></td>
					<td><%=p.getOra()%></td>
					<td><%=p.getNumeroPersone()%></td>
					<td><%=pagatoOut%></td>
					<td><%=p.getIDFCliente()%></td>
					<td><%=catPren%></td>
					<td>
						<form action="visualizzaprenotazione" name="visualizzaDettPrenotazione" method="post">
						<input type="hidden" name="idPrenotazione" value="<%=p.getIDPrenotazione()%>"></input>
						<input type="hidden" name="whatsend" value="visualizzaDettPrenotazione"></input>
						<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="Dettagli"/>
						</form>
					</td>
					</tr>
				<%}
			}%>
		</tbody>
		</table>
		</div>
		<br>
		
		
		
		
		<h3>I miei piatti</h3>
		<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">Foto</th>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Disponibile</th>
				<th>Descrizione</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PiattiBean> piatti = risto.getPiatti();
				for(PiattiBean piatto:piatti){
					
					// Scritta per disponibile
					String dispOut;
					if(piatto.getDisponibile()){
						dispOut = "disponibile";
					}else{
						dispOut = "<span style='color:red'>non disponibile</span>";
					}
					
					%>
					<tr>
					<td><img style="float:left" height='70px' src='<%=piatto.getUrl()%>'/></td>
					<td><%=piatto.getNome()%></td>
					<td><%=piatto.getPrezzo()%></td>
					<td><%=dispOut%></td>
					<td><%=piatto.getDescrizione()%></td>
					<td>
						<form action="aggiungipiattoservlet" name="modificapiatto" method="post">
						<input type="hidden" name="piattoDaModificare" value="<%=piatto.getIDPiatto()%>"></input>
						<input type="hidden" name="whatsend" value="modificapiatto"></input>
						<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="Modifica"/>
						</form>
					</td>
					</tr>
				<%}
			}%>
		</tbody>
		</table>
	    </div>
	    
	</div>
  </div>
</body>
</html>