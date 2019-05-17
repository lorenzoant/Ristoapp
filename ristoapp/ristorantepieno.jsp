<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width">

<title>Ristorante pieno</title>

<%@include file="graphicspuntoacca.jsp"%>

<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Ristorante pieno</h2>
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
<center><br><br><br>	<h3>Ops, il ristorante da cui stai cercando di prenotare è pieno, riprova con un nuovo orario o scegli un altro ristorante :(</h3>
<br><br>
<a href="bacheca.jsp"><input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Torna alla bacheca"/></a>
</body>
</html>