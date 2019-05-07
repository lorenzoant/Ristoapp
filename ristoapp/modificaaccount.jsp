<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.ClientiBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica account</title>
	<%@include file="graphicspuntoacca.jsp"%>
	
	<% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
  	%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
	
	
</head>
<body class="text-center">

	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="profilo.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Modifica account</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	
<% if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){
		
		ClientiBean c = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
	%>
	
	<div class="page">
		<form action="modificaaccountservlet" name="registrautente" method="post">

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="nome" name="nome" value="<%=c.getNome()%>">
			    <label class="mdl-textfield__label" for="nome">Nome</label>
	  		</div><br>
	  		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="cognome" name="cognome" value="<%=c.getCognome()%>">
			    <label class="mdl-textfield__label" for="cognome">Cognome</label>
	  		</div><br>
	
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="email" id="email" name="Email" value="<%=c.getEmail()%>" required>
			    <label class="mdl-textfield__label" for="email">Email</label>
			</div><br>

			<!--<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="password" name="PassHash" value="<%=c.getPassHash()%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno 8 caratteri, un carattere maiuscolo, uno minuscolo e almeno un numero"required>
			    <label class="mdl-textfield__label" for="password">Password</label>
			</div><br>-->

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="indirizzo" name="Indirizzo" value="<%=c.getIndirizzo()%>">
			    <label class="mdl-textfield__label" for="indirizzo">Indirizzo</label>
			</div><br>

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
								<select class="mdl-textfield__input" name = "comuni">
									<option value="null"> </option>
										<% 
					
										Connection conn = null;
										ResultSet rs = null;
										
										try{
											// Stabilisco la connessione con il database
											conn = SaveMySQL.getDBConnection();
											
										    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Comuni;");
										    rs=pst.executeQuery();
										    
										     while(rs.next()){ // Scorro le righe
										          String name = rs.getString("Nome");
										%>
										<option value="<%=name%>"><%=name%></option>
										<%
										     }
										}
										catch(Exception e){    
											System.out.println(e.getMessage());
										}
										%>
										</select>
					        			<label class="mdl-textfield__label" for="nome">Comuni</label>
					        </div><br>		
			
			<input type="checkbox" name="NotificaEmail"
			<%if(c.getNotificaEmail()){%>
				checked
			<%}%>
			>NotificaEmail<br>

			<input type="checkbox" name="Geolocalizzazione"
			<%if(c.getGeolocalizzazione()){%>
				checked
			<%}%>
			>Geolocalizzazione<br>
	  		
	  	
			<input name="whatsend" value="aggiornacliente" type="hidden"/>
			<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="window.location='login.jsp';">Annulla modifiche</button>
			<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="window.location='recuperopassword.jsp';">Modifica Password</button>
			<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="window.location='login.jsp';">Salva ed esci</button>
		</form>
	</div>
	
	<% }else{%>
		Abbiamo riscontrato un problema, perfavore riprova più tardi...
	<%}%>
	
</body>
</html>

