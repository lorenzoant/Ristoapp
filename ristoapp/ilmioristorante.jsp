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
</head>
<body>
	<a href="erroregenerico.jsp">Logout [DA FARE]</a><br><br>
	<h1>Il mio ristorante</h1>
	<h3>Prenotazioni di oggi</h3>
	<h3>Prenotazioni di questa settimana</h3>
	<h3>I miei piatti</h3>
	<a href="aggiungipiatto.jsp">Aggiungi piatto</a><br><br>
	
	<table>
		<tr>
			<th>Foto</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Disponibile</th>
			<th>Descrizione</th>
		</tr>

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
		
	</table>
</body>
</html>