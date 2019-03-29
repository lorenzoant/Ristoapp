<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica password</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body style="text-align: center;">
	<div class="mdl-layout__header">
		<h2>Modifica Password</h2>
	</div>
	<form action="modificapasswordservlet" name="modificapassword" method="post">
		<br><div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="number" id="codice" name="codice" required>
		    <label class="mdl-textfield__label" for="email">Codice di modifica</label>
  		</div><br>
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="password" id="password" name="password" pattern=".{8,}" maxlength="25" required>
		    <label class="mdl-textfield__label" for="password">Nuova Password</label>
  		</div><br>
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="password" id="password2" name="password2" pattern=".{8,}" maxlength="25"required>
		    <label class="mdl-textfield__label" for="password2">Nuova Password</label>
  		</div><br>
		<%
		//System.out.println(request.getAttribute("errorMessage"));
		String avviso = (String)request.getAttribute("errorMessage");
		if(avviso == "errore1"){%>
			<div style="color:red;">Codice errato!</div>
		<%}
		else if(avviso == "errore2"){%>
			<div style="color:red;">Le password non coincidono!</div>
		<%} 
		else if(avviso == "errore3"){%>
			<div style="color:red;">Errore nella modifica, la preghiamo di riprovare più tardi!</div>
		<%}%>
		<input name = "whatsend" value = "modifica" type = "hidden"/>
		<input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type = "submit" value = "modifica"/><br>
	</form>
	<form action="recuperopassword.jsp">
	    <br><input class = "mdl-button mdl-js-button mdl-button--raised mdl-button--accent"  type="submit" value="Indietro" />
	</form>
</body>
</html>