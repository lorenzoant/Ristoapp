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
</head>
<body class="text-center">

	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="ilmioristorante.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Modifica account</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	
	
	<% if(request.getSession() != null && request.getSession().getAttribute("CLIENTEDAMODIFICARE") != null){
		
		ClientiBean c = (ClientiBean)request.getSession().getAttribute("CLIENTEDAMODIFICARE");
	%>
	
	<div class="page">
		<form action="accountservlet" name="registrautente" method="post">

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

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="password" id="password" name="PassHash" value="<%=c.getPassHash()%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno 8 caratteri, un carattere maiuscolo, uno minuscolo e almeno un numero"required>
			    <label class="mdl-textfield__label" for="password">Password</label>
			</div><br>

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="indirizzo" name="Indirizzo" value="<%=c.getIndirizzo()%>">
			    <label class="mdl-textfield__label" for="indirizzo">Indirizzo</label>
			</div><br>

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			     <input class="mdl-textfield__input" type="text" id="comune" name="Comune" value="<%=c.getComune()%>">
			     <label class="mdl-textfield__label" for="comune">Comune</label>
			</div><br>

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			     <input class="mdl-textfield__input" type="text" id="lingua" name="Lingua" value="<%=c.getLingua()%>">
			     <label class="mdl-textfield__label" for="lingua">Lingua</label>
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
			<input type = "button" value = "Cronologia Pagamenti"/>
			<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Salva ed esci</button>
		</form>
	</div>
	
	<% }else{%>
		Abbiamo riscontrato un problema, perfavore riprova più tardi...
	<%}%>
	
</body>
</html>
