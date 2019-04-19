<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="graphicspuntoacca.jsp"%>
</head>
<body>
<div>
	<table border="1" class="centratabella">
		<tr style="font-size: 18px;">
			<th>Nome</th>
			<th>Categoria</th>
			<th>Indirizzo</th>
			<th>Telefono</th>
			<th>Email</th>
			<th>Comune</th>
			<th>Descrizione</th>
			<th>Climatizzazione</th>
			<th>Animali</th>
			<th>Wifi</th>
			<th>Disabili</th>
			<th>Parcheggio</th>
		</tr>
		<% 
		ArrayList<RistorantiBean> listaristoranti = new ArrayList <RistorantiBean>(); //oggetto ristorante
		SaveMySQL prendi = new SaveMySQL(); //oggeto save
		listaristoranti = prendi.InformazioniRistorante(); //prendo tutti i ristoranti
		
		for(RistorantiBean lista:listaristoranti){
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
			<tr >
			
				<td><%=Nome%></td>
				<td><%=NomeCatCucina %></td>
				<td><%=Indirizzo%></td>
				<td><%=Telefono%></td>
				<td><%=Email%></td>
				<td><%=Comune%></td>
				<td><%=Descrizione%></td>
				<td><%=SerClimatizzazione%></td>
				<td><%=SerAnimali%></td>
				<td><%=SerWifi%></td>
				<td><%=SerDisabili%></td>
				<td><%=SerParcheggio%></td>
			
			</tr>
		<%
			}
		%>
		</table>
	</div>
</body>
</html>