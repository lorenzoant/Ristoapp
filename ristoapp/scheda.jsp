<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Scheda Ristorante</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<%
	System.out.println("ciao");
	if(request.getSession().getAttribute("RISTO") != null ){	
			ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			RistorantiBean SRisto = (RistorantiBean)request.getSession().getAttribute("RISTO");
			
			String nomeLoggato = cli.getNome(); //nome del profilo
			int ID = SRisto.getIDRistorante(); //id del ristorante
			System.out.println(ID);
			String name = SRisto.getNome();
				if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
					response.sendRedirect("login.jsp");
				}%>
		<%}
		else{
			// L'utente non  loggato
			response.sendRedirect("login.jsp");
		}
	
		SaveMySQL save = new SaveMySQL(); //oggeto save
		%>
</head>
		

<body>

	<div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle">Dettaglio Ristorante</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
		</header>
		<thead>
		</thead>
		<tbody>
		</tbody>

</body>
</html>

