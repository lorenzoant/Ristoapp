<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="ISO-8859-1">
	<title>Sezione pagamento</title>
	
</head>

<body>

<form action="pagamentoservlet" name="pagamento" method="post">
		<div>Tipo carta
		<select name="categoria">
			<% 
			Connection conn = null;
			ResultSet rs = null;
			
			try{
				// Stabilisco la connessione con il database
				conn = SaveMySQL.getDBConnection();
				
			    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Categoria_carte;");
			    rs=pst.executeQuery();
			    
			    while(rs.next()){ // Scorro le righe ottenute
			    	int id = rs.getInt("IDCatCarta");
					String nome = rs.getString("Nome");
			%>
			<option value="<%=id%>"><%=nome%></option>
			<%
				}
			}
			catch(Exception e){    
				System.out.println(e.getMessage());
			}
			%>
		</select><br>
		<div>PAN: <input name="pan" value="" type="text"/></div><br>
		<div>CVV: <input name="cvv" value="" type="text"/></div><br>
		<div>Data di scadenza: <input name="scadenza" value="" type="date"/></div><br>
		<input value="Procedi al pagamento" type="submit">
</form>
	
<form name="SaveOnDB" action="pagamentoservlet" method="post">
	<input name="whatsend" value="SaveInDB" type="hidden"><br>
	<input type="submit" value="SaveInDB">
</form>
	
</body>

</html>
