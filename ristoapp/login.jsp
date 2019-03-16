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
		E-mail <input type = "text" name = "email" required="required"/><br><br>
		Password <input type = "password" name = "password" id="password" required="required"/><input type="checkbox" onclick="mostra()"><br>
		<input name = "whatsend" value = "invia" type = "hidden"/>
		<input type = "submit" value = "accedi"/><br>
	</form>
	<%
		//System.out.println(request.getAttribute("errorMessage"));
		String avviso = (String)request.getAttribute("errorMessage");
		if(avviso == "errore"){
			%>
			   	<div style="color:red;">E-mail e/o password errate</div>
			<%
		}
	%>
	<a href="recuperopassword.jsp">Password dimenticata?</a>
	</body>
	<script>
		function mostra() {
		  var x = document.getElementById("password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	</script>
</html>