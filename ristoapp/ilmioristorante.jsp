<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang3.time.DateUtils"%>
<%@page import="ristoapp.bean.PiattiBean"%>
<%@page import="ristoapp.bean.RistorantiBean"%>
<%@page import="ristoapp.bean.PrenotazioniBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Il mio ristorante</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  <header class="mdl-layout__header">
	    <div class="mdl-layout__header-row">
	      <span class="mdl-layout-title">RistoApp - Il mio ristorante</span>
	      <div class="mdl-layout-spacer"></div>
	    </div>
	  </header>
	  <div class="mdl-layout__drawer">
	    <span class="mdl-layout-title">Menu ristoratore</span>
	    <nav class="mdl-navigation">
	      <a class="mdl-navigation__link" href="">Riaggiorna [DA FARE]</a>
	      <a class="mdl-navigation__link" href="aggiungipiatto.jsp">Aggiungi piatto</a>
	      <a class="mdl-navigation__link" href="">Modifica ristorante [albertini]</a>
	      <a class="mdl-navigation__link" href="">Modifica piatto [PRESTO DISPONIBILE]</a>
	      <a class="mdl-navigation__link" href="">Logout [DA FARE]</a>
	    </nav>
	  </div>
	  <div class="mdl-layout__content page">
	  
	  	<!-- PAGE CONTENT -->
		<h3>Prenotazioni di oggi</h3>
		<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
		<thead>
			<tr>
				<th>Data</th>
				<th>Ora</th>
				<th>Persone</th>
				<th>Stato pagamento</th>
				<th>IDF cliente</th>
				<th>IDF cat prenotazione</th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				Date today = new Date();
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PrenotazioniBean> prenotazioni = risto.getPrenotazioni();
				for(PrenotazioniBean p:prenotazioni){
					if(DateUtils.isSameDay(p.getData(), today)){%>
					<tr>
					<td><%=p.getData()%></td>
					<td><%=p.getOra()%></td>
					<td><%=p.getNumeroPersone()%></td>
					<td><%=p.getStatoPagamento()%></td>
					<td><%=p.getIDFCliente()%></td>
					<td><%=p.getIDFCatPrenotazione()%></td>
					</tr>
					<%}
				}
				
			}%>
		</tbody>
		</table>
		<br>
		
		
		
		
		<h3>Prenotazioni di questa settimana [Da mettere le date nella query]</h3>
		<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
		<thead>
			<tr>
				<th>Data</th>
				<th>Ora</th>
				<th>Persone</th>
				<th>Stato pagamento</th>
				<th>IDF cliente</th>
				<th>IDF cat prenotazione</th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PrenotazioniBean> prenotazioni = risto.getPrenotazioni();
				for(PrenotazioniBean p:prenotazioni){%>
					<tr>
					<td><%=p.getData()%></td>
					<td><%=p.getOra()%></td>
					<td><%=p.getNumeroPersone()%></td>
					<td><%=p.getStatoPagamento()%></td>
					<td><%=p.getIDFCliente()%></td>
					<td><%=p.getIDFCatPrenotazione()%></td>
					</tr>
				<%}
			}%>
		</tbody>
		</table>
		<br>
		
		
		
		
		<h3>I miei piatti</h3>
		<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">Foto</th>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Disponibile</th>
				<th>Descrizione</th>
			</tr>
		</thead>
		<tbody>
	
		<% 	if(request.getSession() != null && request.getSession().getAttribute("RISTORANTELOGGATO") != null){
				
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				ArrayList<PiattiBean> piatti = risto.getPiatti();
				for(PiattiBean piatto:piatti){%>
					<tr>
					<td><img height='70px' src='<%=piatto.getUrl()%>'/></td>
					<td><%=piatto.getNome()%></td>
					<td><%=piatto.getPrezzo()%></td>
					<td><%=piatto.getDisponibile()%></td>
					<td><%=piatto.getDescrizione()%></td>
					</tr>
				<%}
			}%>
		</tbody>
		</table>
	    
	    
	</div>
  </div>
</body>
</html>