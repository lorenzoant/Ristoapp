<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica password</title>
</head>
<body>
	<form action="modificapasswordservlet" name="modificapassword" method="post">
		Codice di modifica <input name="codice" type="number" required="required"/><br><br>
		Nuova Password <input name="password" value="" type="password" required="required"/><br><br>
		Re-Nuova Password <input name="password2" value="" type="password" required="required"/><br><br>
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
		<input type = "submit" value = "modifica"/><br>
	</form>
	<form action="recuperopassword.jsp">
	    <input type="submit" value="Indietro" />
	</form>
</body>
</html>