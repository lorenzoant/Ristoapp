<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.orange-red.min.css" /> 
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</head>
<body>
	<form action="aggiungipiattoservlet" name="aggiungipiatto" method="post">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="text" id="nome" name="nome" required>
		    <label class="mdl-textfield__label" for="nome">Nome</label>
  		</div><br>
  		
  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="text" id="descrizione" name="descrizione">
		    <label class="mdl-textfield__label" for="descrizione">Breve descrizione</label>
  		</div><br>

		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <select class="mdl-textfield__input" id="categoria" name="categoria">
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
		    </select>
		    <label class="mdl-textfield__label" for="categoria">Categoria</label>
		</div><br>
		
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" name="prezzo" type="number" min="0" step="0.01" required>
		    <label class="mdl-textfield__label" for="prezzo">Prezzo</label>
  		</div><br>
		
  		<label class="mdl-checkbox mdl-js-checkbox" for="disponibile">
        	<input type="checkbox" id="disponibile" class="mdl-checkbox__input" name="disponibile" checked>
            <span class="mdl-checkbox__label">Disponibile</span>
        </label><br>
  		
  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="text" id="url" name="url">
		    <label class="mdl-textfield__label" for="url">URL http foto</label>
  		</div><br>
  		
  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		    <input class="mdl-textfield__input" type="text" id="allergeni" name="allergeni">
		    <label class="mdl-textfield__label" for="allergeni">Allergeni</label>
  		</div><br>
  	
		<input name="whatsend" value="aggiunginuovopiatto" type="hidden"/>
		
		<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Aggiungi piatto al tuo ristorante</button>
	</form>
</body>
</html>