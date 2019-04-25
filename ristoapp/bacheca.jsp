<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%//riprendo la session da Login per avere i dati del cliente

	
		ArrayList<RistorantiBean> rist = new ArrayList <RistorantiBean>(); //oggetto ristorante
		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti
		
		
%>
    
<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Refresh" CONTENT="60; url=ilmioristorantecaricamento.jsp"> 
	<title>Home&#9773;</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
		
  		if(cli.getLivAutorizzazioni() != 0){
  			// L'utente non è un cliente
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
</head>
		

<body>

	<div class="mdl-layout mdl-js-layout">
	    <header class="custom-header mdl-layout__header mdl-layout__header">
			<div>
				<table style="width:100%">
					<tr>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle">Home - Bacheca</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>
		</header>
		<div class="mdl-layout__drawer">
			<h4 style="text-align:center;">Menu</h4><hr>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link" href="ilmioristorantecaricamento.jsp">Profilo di <%=nomeLoggato%></a>
		        <a class="mdl-navigation__link" href="aggiungipiatto.jsp">Mappa [fare]</a>
			    <hr>
			    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
		  	</nav>
		</div>
		
		
	  	<div class="mdl-layout__content page">
	  
	  	<!-- PAGE CONTENT -->
	  	
	  	<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
				
		<tbody>
	
		<%
				
				for(RistorantiBean lista:rist){
					
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
					 Boolean SerClimatizzazione = lista.getSerClimatizzazione();
					 Boolean SerAnimali = lista.getSerAnimali();
					 Boolean SerWifi = lista.getSerWifi();
					 Boolean SerDisabili = lista.getSerDisabili();
					 Boolean SerParcheggio = lista.getSerParcheggio();
					 String disp = "";
					 int np = lista.getNumeroPosti(); //numero posti massimo di un ristorante
					 int n = save.disp(IDRistorante);
					 
					if((np-n) > 0){
						disp = "<span style='color:orange'> Disponibile</span>";
					}else{
						disp = "<span style='color:red'>Non Disponibile</span>";
					}
				}
					
			%>
			
		</table>
		</div>
		<br>
		
		

	

		</div>
		<br>
		
		
		
		
	
</body>
	
</html>

