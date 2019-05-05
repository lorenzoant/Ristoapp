<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width">

<title>Prenotazione completata</title>

<%@include file="graphicspuntoacca.jsp"%>

<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Prenotazione completata</h2>
								</td>
								<td>
									<img class="logo" src="MEDIA/logo.png"/>
								</td>
							</tr>
						</table>
				</center>
			</div>
</head>
<body>
<center><br><br><br>	<h3>Grazie per aver prenotato con RistoApp, il tuo ordine è stato inviato al ristorante.</h3>
<br><br>
<a href="pagamento.jsp"><input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Procedi al pagamento"/></a><br><br>
<a href="bacheca.jsp"><input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Torna alla bacheca"/></a>
</body>
</html>