<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<head>
	<meta charset="ISO-8859-1">
	<title>Recupero password</title>
</head>
<body>
	<form action="recuperopasswordservlet" name="recuperopassword" method="post">
		E-mail <input name="email" value="" type="text"/><br><br>
		Ti verrà inviata una mail con il link per ripristinare la password.<br>
		<div class="g-recaptcha" data-sitekey="6LccHZUUAAAAACfyKqv91exddQdqzJfeoAxOY9IB"></div><br>
		<%
		//System.out.println(request.getAttribute("errorMessage"));
		String avviso = (String)request.getAttribute("errorMessage");
		if(avviso == "errore"){%>
			<div id="scritta" style="display: none; color:red;">Completa il captcha!</div>
		<%}%>
		<input name = "whatsend" value = "recupera" type = "hidden"/>
		<input type = "submit" value = "recupera"/><br>
	</form>
	<form action="login.jsp">
	    <input type="submit" value="Indietro" />
	</form>
</body>
</html>