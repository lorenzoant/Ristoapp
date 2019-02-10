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
		<input value="Recupero" type="submit">
	</form>
</body>
</html>