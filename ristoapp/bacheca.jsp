<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%//riprendo la session da Login per avere i dati del cliente

		ArrayList<RistorantiBean> rist = new ArrayList <RistorantiBean>(); //oggetto ristorante list
		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti
				
%>
    
<!DOCTYPE html>

	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>Home</title>
			<%@include file="graphicspuntoacca.jsp"%>
			
<% // Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato

	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome(); //nome del profilo
		
  		if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
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
			        <a class="mdl-navigation__link" href="about.jsp">About </a>
			        <a class="mdl-navigation__link" href="contatti.jsp">Contatti </a>
			        <a class="mdl-navigation__link" href="mappa.jsp">Mappa </a>
				    <hr>
				    <a class="mdl-navigation__link" href="logoutservlet">Logout</a>
			  	</nav>
		</div>
		
	  	<div class="mdl-layout__content page">

	  		<div style="overflow-x: auto;">
	  	
				<form action="BachecaServlet">
				  <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
						<label class="mdl-button mdl-js-button mdl-button--icon" for="sample6">
						<i class="material-icons">search</i>
			   			</label>
			  		  <div class="mdl-textfield__expandable-holder">
			     		 <input class="mdl-textfield__input" type="text" id="sample6">
			    		 <input type="hidden" name="ricerca" value="ricerca">
			    	  	 <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
			  		  </div>
			 	 </div>
				</form>
	
			  <button type="button" class="mdl-button show-modal">Cerca per</button>
			 	 <form action="" name="">
			 	 <dialog class="mdl-dialog">
			  		  <div class="mdl-dialog__content">
			     	 <p>Per migliorare la tua esperienza, filtra la ricerca.</p>
			   		  </div>
			    <div class="mdl-dialog__actions mdl-dialog__actions--full-width">
			      <input type="submit" class="mdl-button">prea</input>
			      <button type="button" class="mdl-button">Nome</button>
			      <button type="button" class="mdl-button ">Categoria</button>
			      <button type="button" class="mdl-button ">Comune</button>
			      <button type="button" class="mdl-button ">Climatizzazione</button>
			      <button type="button" class="mdl-button ">Animali</button>
			      <button type="button" class="mdl-button ">Parcheggio</button>
			      <button type="button" class="mdl-button ">Disabili</button>
			       <button type="button" class="mdl-button close">Esci</button>
			      
			    </div>
			  </dialog>
			  </form>
			  
			  <script>
			    var dialog = document.querySelector('dialog');
			    var showModalButton = document.querySelector('.show-modal');
			    if (! dialog.showModal) {
			      dialogPolyfill.registerDialog(dialog);
			    }
			    showModalButton.addEventListener('click', function() {
			      dialog.showModal();
			    });
			    dialog.querySelector('.close').addEventListener('click', function() {
			      dialog.close();
			    });
			  </script>

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
					 String Comune = lista.getComune();
					 String url = lista.getUrl();
					 int stelle = save.stelle_risto(IDRistorante);
				
					
			%>

					<tr>
					<td><img style="float:left" height="70px" width="100px" src="<%=url %>"/></td>
					<td><%=Nome%></td>
					<td><%=NomeCatCucina%></td>
					<td><%=Comune%></td>
					
					<td><%while(stelle > 0){%>
								&#9733;
								<% stelle = stelle - 1;
						} %>
					</td>
	
					<td>
						<form action="BachecaServlet" name="scheda" method="post">
						
						<input type="hidden" name="whatsend" value="scheda"></input>
						<input type="hidden" name="IDRisto" value="<%=IDRistorante%>"></input>
						<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="dettaglio"/>
						</form>
					</td>
					</tr>
		<%
	}
	%>
	
		</tbody>
		</table>
			
		</center>
		</div>
		<br>
		
		</div>
		<br>
</body>
</html>

