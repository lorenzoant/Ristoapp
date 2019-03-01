<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Recupero password</title>
</head>
<body>
	<form action="recuperopasswordservlet" name="recuperopassword" method="post">
		E-Mail <input name="email" value="" type="text"/><br><br>
		Ti verrà inviata una mail con il link per ripristinare la password.<br>
		<input name = "whatsend" value = "recupera" type = "hidden"/>
		<input type = "submit" value = "recupera"/><br>
	</form>
	<form action="login.jsp">
	    <input type="submit" value="Indietro" />
	</form>
</body>
</html>