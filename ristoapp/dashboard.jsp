<%@page import="ristoapp.bean.ClientiBean" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
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
	
	ClientiBean admin = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");	//utente loggato
	String nome = admin.getNome();
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
					
					<h5>Ciao <%=nome %>:
					<%if(Statistiche == true){%>
						Statistiche</h5>
						<div>
							mostra Statistiche
						</div>
					<%}
					else if(Introiti == true){%>
						Introiti</h5>
						<div>
							mostra Introiti
						</div>
					<%}
					else if(Listaristoranti == true){%>
						Lista ristoranti</h5>
						<%@include file="listaristoranti.jsp"%>
					<%}
						else if(Listautenti == true){%>
						Lista utenti</h5>
						<div>
							<table border="1" class="centratabella" style="width:80%;">
								<tr style="font-size: 18px;">
									<th>Cognome</th>
									<th>Nome</th>
									<th>Email</th>
									<th>Livello Autorizzazioni</th>
									<th>Indirizzo</th>
									<th>Comune</th>
									<th>Lingua</th>
								</tr>
								<%
								ArrayList<ClientiBean> listautenti = new ArrayList <ClientiBean>(); //oggetto ristorante
								SaveMySQL prendiutenti = new SaveMySQL(); //oggeto save
								listautenti = prendiutenti.InformazioniClienti(); //prendo tutti i ristoranti
								
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
							</table>
						</div>
					<%} %>
					
					<hr>
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