<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ristoapp.bean.ClientiBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
			<meta name="viewport" content="width=device-width">
			<title>RistoApp-Nuova Prenotazione </title>

			<%@include file="graphicspuntoacca.jsp"%>

			<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Prenotazione</h2>
								</td>
								<td>
									<img class="logo" src="MEDIA/logo.png"/>
								</td>
							</tr>
						</table>
				</center>
			</div>
			
	<%// Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato
	
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
<body class="text-center">
<center>
<form action="nuovaprenotazioneservlet" name="nuovaprenotazione" method="POST">

		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		<input class="mdl-textfield__input" name="data" value="" type="date" required/>
		<label class="mdl-textfield__label" for="data">Data</label>
		</div><br>
		
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		<input class="mdl-textfield__input" name="ora" value="" type="time" required/>
		<label class="mdl-textfield__label" for="ora">Ora</label>
		</div><br>
		
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		<input class="mdl-textfield__input" name="posti" value="" type="number" required/>
		<label class="mdl-textfield__label" for="posti">Posti</label>
		</div><br>
		
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		<select class="mdl-textfield__input" name="categoria">
			<option value="1">Asporto</option>
			<option value="2">Consegna a casa</option>
			<option value="3">Al ristorante</option>
		</select>
		<label class="mdl-textfield__label" for="categoria">Categoria</label>
		</div><br>
		
		<input name="whatsend" value="creaprenotazione" type="hidden"><br>
		
		<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Crea Prenotazione"/><br><br>
		
	</form>
	</center>
</body>

</html>