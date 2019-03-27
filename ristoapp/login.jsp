<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login RistoApp</title>
		<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<body style="text-align: center;">
		<br>
		<h3>RistoApp</h3>
		<form action = "loginservlet" name = "login" method ="post">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="email" id="email" name="email" required>
			    <label class="mdl-textfield__label" for="email">Email</label>
	  		</div><br>
	  		
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="password" id="password" name="password" required>
			    <label class="mdl-textfield__label" for="password">Password</label>
	  		</div><br>
	  		<input type="checkbox" onclick="mostra()"><br>
	  		
			<input name = "whatsend" value = "invia" type = "hidden"/>
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "accedi"/><br>
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