<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recupero password</title>
</head>
<body>
	<form action="/ristoapp/RecuperoPasswordServlet" name="login" method="post">
		E-Mail <input name="email" value="" type="text"/><br><br>
		<input value="Recupero" type="submit">
	</form>
</body>
</html>