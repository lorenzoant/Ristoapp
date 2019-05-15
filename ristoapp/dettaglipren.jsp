<%@page import="ristoapp.db.SaveMySQL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="ristoapp.bean.QueryPiattiPrenotatiBean"%>
<%@page import="ristoapp.bean.PrenotazioniBean"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dettagli prenotazione</title>
	<%@include file="graphicspuntoacca.jsp"%>
		<% 
		// Controllo se chi accede a questa pagina ha l'autorizzazione
		String nomeLoggato = "";
		if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
			ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			nomeLoggato = cli.getNome();
	  		if(cli.getLivAutorizzazioni() != 0){
	  			// L'utente non è un ristoratore
	  			response.sendRedirect("login.jsp");
	  		}%>
		<%}
		else{
			// L'utente non  loggato
			response.sendRedirect("login.jsp");
		}%>
		
		<style type="text/css">
		td, th{
  			text-align:center !important; 
  		}
  		span{
  			color: orange;
  		}
		</style>
		
		<script type="text/javascript">
			function conferma() {
				//funzione per richiedere la conferma per eliminare la prenotazione
				if (confirm('Sei sicuro di voler eliminare questa prenotazione?')) {
					document.getElementById("elimina").submit();
				}
			}
		</script>
		
</head>
<body class="text-center">

	<div class="mdl-layout__header">		
		<table style="width:100%;">
			<tr>
				<td align="left"><a href="listaprenotazioni.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Dettagli prenotazine</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
		
	<% 
		int idpren= Integer.parseInt( request.getParameter("idpren") );
		SaveMySQL db = new SaveMySQL();
		
		ArrayList<QueryPiattiPrenotatiBean> dettagli = new ArrayList<QueryPiattiPrenotatiBean>();
		dettagli = db.prelevaDettagliPrenotazioneConPiatti(idpren);
		PrenotazioniBean pren = new PrenotazioniBean();
		pren = db.prelevaPrenotazione(idpren);		
	%>
	
	<div class="page centratabella">
	
		<h3>Prenotazione n° <span><%= pren.getIDPrenotazione() %></span></h3>
		
		<h4>Hai prenotato per le ore: <span><%=pren.getOra() %></span> del giorno <span><%=pren.getData() %></span></h4>
		
		<%if(pren.getIDFCatPrenotazione()== 3) {%>
			<h4>La tua prenotazione comprende <span><%=pren.getNumeroPersone() %></span> posti a sedere</h4>
		<%} %>
		<%if(!dettagli.isEmpty()){ %>
		<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp" style=" margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th>Foto</th>
				<th>Nome</th>
				<th>Quantità</th>
				<th>Prezzo base</th>
				<th>Sconto</th>
				<th>Prezzo finale</th>
			</tr>
		</thead>
		<tbody>
		
		<% 
		float prezzoFinale, totale = 0;
		for(QueryPiattiPrenotatiBean p:dettagli){
			prezzoFinale = p.getPrezzo()*p.getQuantita()*((100-p.getSconto())/100);
			totale += prezzoFinale;
		%>
			<tr>
				<td><img style="margin-left: auto" height='70px' src='<%=p.getUrl()%>'/></td>
				<td><%=p.getNome()%></td>
				<td><%=p.getQuantita()%></td>
				<td><%=p.getPrezzo()%></td>
				<td><%=p.getSconto()%></td>
				<td><b><%=prezzoFinale%></b></td>
			</tr>
		<%}%>
		</tbody>
		<thead>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th>Totale</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><b style='color:green'><%=totale%></b></td>
			</tr>
		</tbody>
		</table>
		<%}else{%>
		<p>Non hai specifato alcun piatto durante l'ordinazione, potrai ordinare una volta arrivato al ristorante</p>
		<%} %>
		<!-- Nel caso in cui il pagamento non sia stato già fatto -->
		<%if (!pren.getStatoPagamento()){ %>
			<a href="pagamento.jsp?idpren=<%= idpren %>"><input style="margin-top: 20px" type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Procedi al pagamento"/></a><br>
			
		<form action="nuovaprenotazioneservlet" id="elimina" method="POST">	
		
			<input name="idpren" value="<%=idpren %>" type="hidden">
			<input name="whatsend" value="elimina" type="hidden">
			<input style="margin-top: 20px" type = "button" onclick="conferma()" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Elimina ordine"/>
			
		</form>

		<%}else{ %>
			<input style="margin-top: 20px" type = "button" onclick="conferma()" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" disabled value = "Gli ordini già pagati non possono essere eliminati"/>
		<%} %>
		</div>
	</div>
	

</body>
</html>