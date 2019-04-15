<%@page import="ristoapp.db.SaveMySQL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli Prenotazione</title>
</head>
<body>
	<table>
		<thead>Selezione i piatti che vuoi ordinare</thead>
		
		<% 
			ResultSet rs;  
			SaveMySQL db= new SaveMySQL();
			int risto= Integer.parseInt(request.getSession().getAttribute("idristorante").toString());
			
			rs=  db.listaPiatti(risto);
			
		%>
	
	</table>
</body>
</html>