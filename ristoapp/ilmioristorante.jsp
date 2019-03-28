<%@page import="ristoapp.bean.PiattiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ristoapp.bean.RistorantiBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Il mio ristorante</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body>
	<div class="mdl-layout__header text-center">
		<h3>RistoApp - Il mio ristorante</h3>
	</div>
	
	<div class="page">
		<a href="erroregenerico.jsp">Logout [DA FARE]</a><br><br>
		<h1>Il mio ristorante</h1>
		<h3>Prenotazioni di oggi</h3>
		<h3>Prenotazioni di questa settimana</h3>
		<h3>I miei piatti</h3>
		<a href="aggiungipiatto.jsp">Aggiungi piatto</a><br><br>
		
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
					<td><%=piatto.getUrl() %></td>
					<td><%=piatto.getNome() %></td>
					<td><%=piatto.getPrezzo() %></td>
					<td><%=piatto.getDisponibile() %></td>
					<td><%=piatto.getDescrizione() %></td>
					</tr>
				<%}
			}%>
		</tbody>
		</table>
	</div>
</body>
</html>