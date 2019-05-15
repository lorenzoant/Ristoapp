<%@page import="ristoapp.bean.ClientiBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>Contatti</title>
			<%@include file="graphicspuntoacca.jsp"%>
			
<% // Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato

	String mail = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		mail = cli.getEmail(); //nome del profilo
		cli.setEmail(mail);
  		if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}
%>
		</head>
		<body>
		
		<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-tabs">
 	          <header class="mdl-layout__header">
    		<div class="mdl-layout__header-row">
   			 
		     <td align="center" style="width:80%">
			<h2 style="display: inline;vertical-align:middle">Contatti</h2>
			<img class="logo" style="vertical-align:middle"  src="MEDIA/logo.png"/>
			</td>
    </div>
  
    <!-- Tabs -->
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
      <a href="#fixed-tab-1" class="mdl-layout__tab is-active">EMAIL</a>
      <a href="https://www.instagram.com/therealristoapp/?hl=it" class="mdl-layout__tab ">INSTAGRAM</a>
       </div>
  </header>
  
 
  <main class="mdl-layout__content">
    <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
      <div class="page-content">
      <center>
      <br><br>
      
      <form action="ContattiServlet" name="contattiservlet" method="post">
      <center>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="email" id="email" name="email" value="<%=mail%>">
			    <label class="mdl-textfield__label" for="email">La tua email</label>
		   </div>
		   <br>
		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	  			<label class="mdl-textfield__label" for="AreaDescrizione">Testo</label>
	  			<textarea class="mdl-textfield__input" type="text" rows= "2" id="AreaDescrizione" name="descrizione"></textarea>
	  		</div>
	  		<br>
	  		<input name = "whatsend" value = "contattaci" type = "hidden"/>
			<input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type = "submit" value = "contattaci"/>
	  	
	  	
		</center>
		</form>
		<br>
		<form action="ContattiServlet" name="contattiservlet" method="post">
		<input name = "whatsend" value = "dietro" type = "hidden"/>
			<input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type = "submit" value = "indietro"/>
			
		</form>

	</center>
      
	</div>
    </section>
   
  </main>
</div>
		</body>
</html>