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
			<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp centratabella" style="width:80%;"><!-- <table border="1" class="centratabella" style="width:80%;"> -->
				<!-- <tr style="font-size: 18px;"> -->
				<thead>
				  	<tr>
					    <th class="mdl-data-table__cell--non-numeric" style="text-align:right">Nome</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Categoria</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Indirizzo</th>
						<th style="text-align:right">Telefono</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Email</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Comune</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Descrizione</th>
						<th class="mdl-data-table__cell--non-numeric">Climatizzazione</th>
						<th class="mdl-data-table__cell--non-numeric">Animali</th>
						<th class="mdl-data-table__cell--non-numeric">Wifi</th>
						<th class="mdl-data-table__cell--non-numeric">Disabili</th>
						<th class="mdl-data-table__cell--non-numeric">Parcheggio</th>
					</tr>
				</thead>
				<tbody>
				<% 
				ArrayList<RistorantiBean> listaristoranti = new ArrayList <RistorantiBean>(); //oggetto ristorante
				SaveMySQL prendi = new SaveMySQL();
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
				</tbody>
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