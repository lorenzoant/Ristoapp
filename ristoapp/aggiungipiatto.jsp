<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
</head>
<body>
	<form action="aggiungipiattoservlet" name="aggiungipiatto" method="post">
		Nome <input name="nome" type="text" required/><br>
		Breve desrizione <input name="descrizione" type="text"/><br>
		Categoria
		<select name="categoria">
			<% 
			Connection conn = null;
			ResultSet rs = null;
			
			try{
				// Stabilisco la connessione con il database
				conn = SaveMySQL.getDBConnection();
				
			    PreparedStatement pst = conn.prepareStatement("SELECT * FROM CategoriaPiatti;");
			    rs=pst.executeQuery();
			    
			    while(rs.next()){ // Scorro le righe ottenute
			    	int id = rs.getInt("IDCatPiatto");
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
		Prezzo <input name="prezzo" type="number" step="0.1" required/><br>
		Disponibile <input name="disponibile" type="checkbox" checked/><br>
		URL http foto <input name="url" type="text"required/><br>
		Allergeni <input name="allergeni" type="text"/><br>
		<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
		<input value="Aggiungi piatto al tuo ristorante" type="submit">
		<br>DEBUG: In questo momento il piatto viene inserito nel database senza associare il ristorante al piatto.
	</form>
</body>
</html>