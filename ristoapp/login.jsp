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
	Password <input type = "password" name = "password" id="password"/><input type="checkbox" onclick="myFunction()"><br>
	<input name = "whatsend" value = "invia" type = "hidden"/>
	<input type = "submit" value = "accedi"/>
</form>
</body>
<script>
	function myFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
</html>