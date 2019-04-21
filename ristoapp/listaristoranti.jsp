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
		<style>
			a {color: black;}
			a:link {text-decoration: none;}
			a:visited {text-decoration: none;}
			a:hover {text-decoration: underline;}
			a:active {text-decoration: underline;}
		</style>
	</head>
	<body>
		<h5><a href="?scelta=listaristoranti">Lista ristoranti</a></h5>
		<div style="overflow-x:auto;">
			<table border="1" class="centratabella" style="width:80%;">
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
					int IDRistorante = lista.getIDRistorante();
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
					String SerClimatizzazione = "no";
					if(lista.getSerClimatizzazione() == true) SerClimatizzazione = "si";
					String SerAnimali = "no";
					if(lista.getSerAnimali() == true) SerAnimali = "si";
					String SerWifi = "no";
					if(lista.getSerWifi() == true) SerWifi = "si";
					String SerDisabili = "no";
					if(lista.getSerDisabili() == true) SerDisabili = "si";
					String SerParcheggio = "no";
					if(lista.getSerParcheggio() == true) SerParcheggio = "si";
				
					if(request.getParameter("idristo") == null){%>
						<tr>
							<%String href="?scelta=listaristoranti&ristorante="+IDRistorante; %>
							<td><a href="<%=href%>"><%=Nome%></a></td>
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
					<%}
					else{//nel caso siamo nell'area "lista introiti"
						if(Integer.parseInt(request.getParameter("idristo")) == IDRistorante){%>
							<tr>
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
					<%}
					}
				}%>
			</table>
			<%
			if(request.getParameter("ristorante") != null){//mostro i ricavi del ristorante selezionato
				%>
					<%@include file="listaintroiti.jsp" %>
				<%
			}
			%>
		</div>
	</body>
</html>