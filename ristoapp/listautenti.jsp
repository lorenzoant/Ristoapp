<%@page import="ristoapp.bean.ClientiBean" %>
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
		<h5><a href="?scelta=listautenti">Lista utenti</a></h5>
		<div style="overflow-x:auto;">
			ordina per:
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=data'">Data Inserimento</button>
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=Cognome'">Cognome</button>
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=Nome'">Nome</button>
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=LivAutorizzazioni'">Autorizzazione</button>
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=Comune'">Comune</button>
			<button class="mdl-button mdl-js-button mdl-button--primary" onclick="window.location='?scelta=listautenti&ordine=Lingua'">Lingua</button><br/><br/>
				  
			<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp centratabella" style="width:80%;"><!-- <table border="1" class="centratabella" style="width:80%;"> -->
				<!-- <tr style="font-size: 18px;"> -->
				<thead>
				  	<tr>
					    <th class="mdl-data-table__cell--non-numeric" style="text-align:right">Cognome</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Nome</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Email</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Livello Autorizzazioni</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Indirizzo</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Comune</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Lingua</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<ClientiBean> listautenti = new ArrayList <ClientiBean>(); //lista degli utenti
				SaveMySQL prendiutenti = new SaveMySQL(); //per chiamare la funzione
				String ordine = request.getParameter("ordine");
				listautenti = prendiutenti.InformazioniClienti(ordine); //prendo tutti i clienti
				
				for(ClientiBean lista:listautenti){
					String Cognome = lista.getCognome();
					String Nome = lista.getNome();
					String Email = lista.getEmail();
					String Indirizzo = lista.getIndirizzo();
					String Comune = lista.getComune();
					String Lingua = lista.getLingua();
					String LivAutorizzazioni = "";
					if(lista.getLivAutorizzazioni() == 0) LivAutorizzazioni = "cliente";
					else if(lista.getLivAutorizzazioni() == 1) LivAutorizzazioni = "ristoratore";
					else LivAutorizzazioni = "amministratore";
							
					%>
					<tr>
						<td><%=Cognome%></td>
						<td><%=Nome%></td>
						<td><%=Email%></td>
						<td><%=LivAutorizzazioni%></td>
						<td><%=Indirizzo%></td>
						<td><%=Comune%></td>
						<td><%=Lingua%></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
	</body>
</html>