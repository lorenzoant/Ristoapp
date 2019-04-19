<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	//decido cosa mostrare
 	Boolean Statistiche = Boolean.parseBoolean(request.getParameter("statistiche"));
	Boolean Introiti = Boolean.parseBoolean(request.getParameter("introiti"));
	Boolean Listaristoranti = Boolean.parseBoolean(request.getParameter("listaristoranti"));
	Boolean Listautenti = Boolean.parseBoolean(request.getParameter("listautenti"));
	if(Introiti == false && Listaristoranti == false && Listautenti == false) Statistiche = true;
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dashboard</title>
		<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<body class="text-center">
		<div class="mdl-layout mdl-js-layout">
		    <header class="custom-header mdl-layout__header mdl-layout__header--waterfall">
				<div>
					<table style="width:100%">
						<tr>
							<td align="center" style="width:100%">
								<h2 style="display: inline;vertical-align:middle">Dashboard</h2>
								<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
							</td>
						</tr>
					</table>
				</div>
			</header>
			<div class="mdl-layout__drawer">
				<h4 style="text-align:center;">Avanzate</h4><hr>
				<nav class="mdl-navigation">
					<a class="mdl-navigation__link" href="dashboard.jsp?statistiche=true">Statistiche</a>
					<a class="mdl-navigation__link" href="dashboard.jsp?introiti=true">Introiti</a>
					<a class="mdl-navigation__link" href="dashboard.jsp?listaristoranti=true">Lista ristoranti</a>
				    <a class="mdl-navigation__link" href="dashboard.jsp?listautenti=true">Lista utenti</a>
				    <hr>
				    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
			  	</nav>
			</div>
			<main class="mdl-layout__content">
				<div class="page-content">
				
					<%if(Statistiche == true){%>
						<div>
							mostra Statistiche
						</div>
					<%}
					else if(Introiti == true){%>
						<div>
							mostra Introiti
						</div>
					<%}
					else if(Listaristoranti == true){%>
						<div>
							mostra Lista ristoranti
						</div>
					<%}
						else if(Listautenti == true){%>
						<div>
							mostra Lista utenti
						</div>
					<%} %>
				
					<br>Account RistoApp creati<br/>
					dato<br/>
					Crescita rispetto all'ultimo mese<br/>
					dato<br/>
					Introiti generati dalle iscrizioni<br/>
					dato<br/>
					Stacco super mitico dopo la tabella per introdurre l'utente ai grafici pewpew, tipo un qualcosa a comparsa ma devo vedere cosa riesco a fare<br/>
					dropdown per decidere il periodo, categoria, regione<br/>
					Magari qualcosa per inviare un messaggio o immagine da mettere in home page<br/>
				</div>
			</main>
		</div>
	</body>
</html>