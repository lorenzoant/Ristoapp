<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import =  "ristoapp.bean.ClientiBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<head>
		<meta charset="ISO-8859-1">
		<title>Nuovo Account</title>
		<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<body class="text-center">
		<center>
			<div class="mdl-layout__header">
				<table style="width:100%">
					<tr>
						<td align="left"><a href="login.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
						<td align="center" style="width:100%">
							<h2 style="display: inline;vertical-align:middle" >Nuovo Account</h2>
							<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
						</td>
					</tr>
				</table>
			</div>

<form method = "post" action = "accountservlet" name = "registrautente">
<table style="text-align:center;">
					<tr>
						<td>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						    	<input class="mdl-textfield__input" type="email" id="email" name="Email" required>
						    	<label class="mdl-textfield__label" for="email">Email</label>
				  			</div>
			  			</td>
			  		</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="password" id="password" name="PassHash" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno 8 caratteri, un carattere maiuscolo, uno minuscolo e almeno un numero"required>
							    <label class="mdl-textfield__label" for="password">Password</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="password" id="password" name="PassHash1" required>
							    <label class="mdl-textfield__label" for="password">Re_Password</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="text" id="nome" name= "Nome">
							    <label class="mdl-textfield__label" for="nome">Nome</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="text" id="cognome" name="Cognome">
							    <label class="mdl-textfield__label" for="cognome">Cognome</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="text" id="indirizzo" name="Indirizzo">
							    <label class="mdl-textfield__label" for="indirizzo">Indirizzo</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="text" id="comune" name="Comune">
							    <label class="mdl-textfield__label" for="comune">Comune</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="text" id="lingua" name="Lingua">
							    <label class="mdl-textfield__label" for="lingua">Lingua</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="checkbox" id="notificaemail" name="NotificaEmail">
							    <label class="mdl-textfield__label" for="notificaemail">Notifica Email</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="checkbox" id="geolocalizzazione" name="Geolocalizzazione">
							    <label class="mdl-textfield__label" for="geolocalizzazione">Geolocalizzazione</label>
					  		</div>
				  		</td>
					</tr>
					<tr>
			  			<td colspan="2">
							<input name = "whatsend" value = "registrautente" type = "hidden"/>
							<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "registrati"/><br>
						</td>
					</tr>
					</table>
	

<%
						String avviso = (String)request.getAttribute("errorMessage");
						if(avviso == "errore"){
							request.getSession().removeAttribute("errorMessage");
							%>
							  
							  
							   			<div style="color:red;">E-mail e/o password errate</div>
							   	
							<%
						}
					%>


</form>

		</center>
	</body>

</html>