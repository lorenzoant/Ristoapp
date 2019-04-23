<%@page import="ristoapp.bean.ClientiBean" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.bean.QueryIntroitiBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	//decido cosa mostrare
	String scelta = "";
	if(request.getParameter("scelta") == null) scelta = "listastatistiche.jsp";
	else scelta = request.getParameter("scelta") + ".jsp";
 	/*Boolean Statistiche = Boolean.parseBoolean(request.getParameter("statistiche"));
	Boolean Introiti = Boolean.parseBoolean(request.getParameter("introiti"));
	Boolean Listaristoranti = Boolean.parseBoolean(request.getParameter("listaristoranti"));
	Boolean Listautenti = Boolean.parseBoolean(request.getParameter("listautenti"));
	if(Introiti == false && Listaristoranti == false && Listautenti == false) Statistiche = true;*/
	
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nome = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nome = cli.getNome();
  		if(cli.getLivAutorizzazioni() != 2){
  			// L'utente non è un ristoratore
  			response.sendRedirect("login.jsp");
  		}
	}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dashboard</title>
		<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<body class="text-center">
		<div class="mdl-layout mdl-js-layout">
		    <header class="mdl-layout__header mdl-layout__header--waterfall">
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
					<a class="mdl-navigation__link" href="?scelta=listastatistiche">Statistiche</a>
					<a class="mdl-navigation__link" href="?scelta=listaintroiti">Introiti</a>
					<a class="mdl-navigation__link" href="?scelta=listaristoranti">Lista ristoranti</a>
				    <a class="mdl-navigation__link" href="?scelta=listautenti&ordine=data">Lista utenti</a>
				    <!--<a class="mdl-navigation__link" href="?listautenti=true&ordine=data">Lista utenti</a>-->
				    <hr>
				    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
			  	</nav>
			</div>
			<main class="mdl-layout__content">
				<div class="page-content">
					
					<h3>Ciao <%=nome %></h3>
					<jsp:include page="<%=scelta %>" ></jsp:include>
				</div>
			</main>
		</div>
	</body>
</html>