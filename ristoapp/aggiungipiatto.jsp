<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.ClientiBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
  		if(cli.getLivAutorizzazioni() != 1){
  			// L'utente non è un ristoratore
  			response.sendRedirect("login.jsp");
  		}%>
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
				<td align="left"><a href="ilmioristorante.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Aggiungi piatto</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="page">
		<form action="aggiungipiattoservlet" name="aggiungipiatto" method="post">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="nome" name="nome" required>
			    <label class="mdl-textfield__label" for="nome">Nome</label>
	  		</div><br>
	  		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="descrizione" name="descrizione">
			    <label class="mdl-textfield__label" for="descrizione">Breve descrizione</label>
	  		</div><br>
	
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <select class="mdl-textfield__input" id="categoria" name="categoria">
			    <% 
					Connection conn = null;
					ResultSet rs = null;
					
					try{
						// Stabilisco la connessione con il database
						conn = SaveMySQL.getDBConnection();
						
					    PreparedStatement pst = conn.prepareStatement("SELECT * FROM CategoriaPiatti;");
					    rs=pst.executeQuery();
					    
					    while(rs.next()){ // Scorro le righe ottenute
					    	int id = rs.getInt("IDCatPiatto");
							String nome = rs.getString("Nome");
					%>
					<option value="<%=id%>"><%=nome%></option>
					<%
						}
					}
					catch(Exception e){    
						System.out.println(e.getMessage());
					}
				%>
			    </select>
			    <label class="mdl-textfield__label" for="categoria">Categoria</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" name="prezzo" type="number" min="0" step="0.01" required>
			    <label class="mdl-textfield__label" for="prezzo">Prezzo</label>
	  		</div><br>
			
			<input type="checkbox" name="disponibile" checked>Disponibile<br>
	  		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="url" name="url">
			    <label class="mdl-textfield__label" for="url">URL http foto</label>
	  		</div><br>
	  		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="allergeni" name="allergeni">
			    <label class="mdl-textfield__label" for="allergeni">Allergeni</label>
	  		</div><br>
	  	
			<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
			
			<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Aggiungi piatto al tuo ristorante</button>
		</form>
	</div>
</body>
</html>