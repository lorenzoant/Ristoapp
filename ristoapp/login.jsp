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
		Password <input type = "password" name = "password" id="password"/><input type="checkbox" onclick="mostra()"><br>
		<input name = "whatsend" value = "invia" type = "hidden"/>
		<input type = "submit" value = "accedi"/><br>
	</form>
	<div id="scritta" style="display: none; color:red;">E-mail e/o password errate</div>
	<a href="recuperopassword.jsp">Password dimenticata?</a>
	</body>
	<script>
		<%
		//System.out.println(request.getAttribute("errorMessage"));
		String avviso = (String)request.getAttribute("errorMessage");
		if(avviso == "errore"){
			%>
			    errorelogin(1);
			<%
		}
		%>
		function mostra() {
		  var x = document.getElementById("password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
		function errorelogin(flag) {
			if(flag == 1){
				var x = document.getElementById("scritta").style.display = "block";
			}
		}
	</script>
</html>