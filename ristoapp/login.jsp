<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
</head>
<body>
<form action = "loginservlet" name = "login" method ="post">
	E-mail <input type = "text" name = "email"/><br><br>
	Password <input type = "text" name = "password"/><br><br>
	<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
	<input type = "submit" value = "accedi"/>
</form>
</body>
</html>