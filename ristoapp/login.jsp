<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>RistoApp</title>
		<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<body class="text-center">
		<center>
			<div class="mdl-layout__header">
				<center>
					<table>
						<tr>
							<td>
								<h2>RistoApp</h2>
							</td>
							<td>
								<img class="logo" src="MEDIA/logo.png"/>
							</td>
						</tr>
					</center>
				</table>
			</div>
			
			<form action = "loginservlet" name = "login" method ="post">
				<table style="text-align:center;">
					<tr>
						<td>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						    	<input class="mdl-textfield__input" type="email" id="email" name="email" required>
						    	<label class="mdl-textfield__label" for="email">Email</label>
				  			</div>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td>
					  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							    <input class="mdl-textfield__input" type="password" id="password" name="password" required>
							    <label class="mdl-textfield__label" for="password">Password</label>
					  		</div>
				  		</td>
						<td>
							<img class="occhio" src="MEDIA/occhio.png" onmouseover="mostra();" onmouseout="nascondi();"/><br>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="2">
							<input name = "whatsend" value = "invia" type = "hidden"/>
							<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "accedi"/><br><br>
						</td>
					</tr>
					<%
						//System.out.println(request.getAttribute("errorMessage"));
						String avviso = (String)request.getAttribute("errorMessage");
						if(avviso == "errore"){
							%>
							   	<tr>
							   		<td colspan="2">
							   			<div style="color:red;">E-mail e/o password errate</div>
							   		</td>
							   	</tr>
							<%
						}
					%>
					<tr>
						<td colspan="2">
							<a href="recuperopassword.jsp">Password dimenticata?</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="account.jsp">Sei un nuovo cliente?</a>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
	<script>
		function mostra() {
		  	var x = document.getElementById("password");
		 	x.type = "text";
		}
		function nascondi(){
			 var x = document.getElementById("password");
			x.type = "password";
		}
	</script>
</html>