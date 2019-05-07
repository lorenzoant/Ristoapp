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
			<title>About</title>
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
		
		
	<!-- Simple header with fixed tabs. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
            mdl-layout--fixed-tabs">
  <header class="mdl-layout__header">
    
    
    <div class="mdl-layout__header-row">
   			 <td align="left"><a href="bacheca.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
		     <td align="center" style="width:80%">
			<h2 style="display: inline;vertical-align:middle">About</h2>
			<img class="logo" style="vertical-align:middle"  src="MEDIA/logo.png"/>
			</td>
    </div>
  
    <!-- Tabs -->
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
      <a href="#fixed-tab-1" class="mdl-layout__tab is-active">Storia</a>
      <a href="#fixed-tab-2" class="mdl-layout__tab">Team</a>
      <a href="#fixed-tab-3" class="mdl-layout__tab">Compagnia</a>
    </div>
  </header>
  
 
  <main class="mdl-layout__content">
    <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
      <div class="page-content">
      <center>
      <div style="margin:100px"  >
     	<h1 style="color:orange">Storia</h1> 
      <br><br>
    fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      </div>
     
	</center>
      
	</div>
    </section>
    <section class="mdl-layout__tab-panel" id="fixed-tab-2">
      <div class="page-content">
      <center>
      <div style="margin:100px"  >
     	<h1 style="color:orange">Team</h1> 
      <br><br>
    fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      </div>
     
	</center></div>
    </section>
    <section class="mdl-layout__tab-panel" id="fixed-tab-3">
      <div class="page-content">
      <center>
      <div style="margin:100px"  >
     	<h1 style="color:orange">Compagnia</h1> 
      <br><br>
    fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      fuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffafuffa
      </div>
     
	</center></div>
    </section>
  </main>
</div>
		</body>
</html>