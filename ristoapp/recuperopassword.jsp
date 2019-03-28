<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<head>
	<meta charset="ISO-8859-1">
	<title>Recupero password</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body style="text-align: center;">
	<div class="mdl-layout__header">
		<h2>Recupero Password</h2>
	</div>
	<h5>Ti verrà inviata una mail con il link per ripristinare la password.</h5>
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
	<form action="login.jsp">
	    <br><input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit" value="Indietro" />
	</form>
</body>
</html>