<%@page import="ristoapp.bean.ClientiBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>Contatti</title>
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
      
      <form action="recuperopasswordservlet" name="recuperopassword" method="post">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="email" id="email" name="email" required>
			    <label class="mdl-textfield__label" for="email">Email</label>
	  		</div><br>
	  		<div class = "text-align">
				<div style = "text-align:center;" class="g-recaptcha" data-sitekey="6LccHZUUAAAAACfyKqv91exddQdqzJfeoAxOY9IB"></div><br>
			</div>
			<%
			//System.out.println(request.getAttribute("errorMessage"));
			String avviso = (String)request.getAttribute("errorMessage");
			if(avviso == "errore2"){%>
				<div style="color:red;">Completa il reCaptcha!</div>
			<%}
			else if(avviso == "errore1"){%>
				<div style="color:red;">Utente non registrato!</div>
			<%} %>
			<input name = "whatsend" value = "recupera" type = "hidden"/>
			<input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type = "submit" value = "recupera"/><br>
		</form>

     
	</center>
      
	</div>
    </section>
   
  </main>
</div>
		</body>
</html>