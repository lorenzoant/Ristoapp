<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%//riprendo la session da Login per avere i dati del cliente

	
		ArrayList<RistorantiBean> rist = new ArrayList <RistorantiBean>(); //oggetto ristorante list
		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti
				
		
%>
    
<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home</title>
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
				<a class="mdl-navigation__link" href="profilo.jsp">Profilo di <%=nomeLoggato%></a>
		        <a class="mdl-navigation__link" href="mappa.jsp">Mappa </a>
			    <hr>
			    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
		  	</nav>
		</div>
		
		
	  	<div class="mdl-layout__content page">
	  
	  	<!-- PAGE CONTENT -->
	  	
	  	<div style="overflow-x: auto;">
	  	<center>
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">Foto</th>
				<th>Nome</th>
				<th>Categoria</th>
				<th>Comune</th>
				<th>Stelle</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<%
				for(RistorantiBean lista:rist){
					
					 int IDRistorante = lista.getIDRistorante();
					 String NomeCatCucina = lista.getNomeCatCucina();
					 String Nome = lista.getNome(); //nome ristorante
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
					 String url = lista.getUrl();
					
					 String disp = "";
					 int np = lista.getNumeroPosti(); //numero posti massimo di un ristorante
					 int n = save.disp(IDRistorante);
					 int stelle = save.stelle_risto(IDRistorante);
				
					 if((np-n)<0){
						 disp = "Disponibile";
					 }else{
						 disp ="<span style='color:red'>non disponibile</span>";
					 }
					 
					
			%>

					<tr>
					<td><img style="float:left" height="70px" width="100px" src="<%=url %>"/></td>
					<td><%=Nome%></td>
					<td><%=NomeCatCucina%></td>
					<td><%=Comune%></td>
					<td><%while(stelle > 0){%>
									&#9733;
									<%
									stelle = stelle - 1;
								}%></td>
	
					<td>
						<form action="" name="modificapiatto" method="post">
						<input type="hidden" name="" value=""></input>
						<input type="hidden" name="whatsend" value=""></input>
						<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="scheda"/>
						</form>
					</td>
					</tr>
		<%
	}%>
		</tbody>
		</table>
			
		</center>
		</div>
		<br>
		
		

	

		</div>
		<br>
		
		
		
		
	
</body>
	
</html>

