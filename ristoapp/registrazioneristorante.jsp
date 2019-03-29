<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body class="text-center">
	
	<div class="mdl-layout__header">
		<h2>RistoApp</h2>
	</div>
	
	<div class="page">
		<form action = "registratiristoranteservlet" name = "account" method ="post">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "nome_ristorante"/>
				<label class="mdl-textfield__label" for="nome">Nome Ristorante</label>
			</div>
		
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "indirizzo"/>
				<label class="mdl-textfield__label" for="nome">Indirizzo</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	
				<input class="mdl-textfield__input" type = "text" name = "telefono"/>
				<label class="mdl-textfield__label" for="nome">Telefono</label>
			</div>
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<input class="mdl-textfield__input" type = "text" name = "email"/>	
				<label class="mdl-textfield__label" for="nome">Email</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<select class="mdl-textfield__input" name = "comuni">
					<option value="null"> </option>
						<% 
	
						Connection conn = null;
						ResultSet rs = null;
						
						try{
							// Stabilisco la connessione con il database
							conn = SaveMySQL.getDBConnection();
							
						    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Comuni;");
						    rs=pst.executeQuery();
						    
						     while(rs.next()){ // Scorro le righe
						          String name = rs.getString("Nome");
						%>
						<option value="<%=name%>"><%=name%></option>
						<%
						     }
						}
						catch(Exception e){    
							System.out.println(e.getMessage());
						}
						%>
						</select>
	        			<label class="mdl-textfield__label" for="nome">Comuni</label>
	        </div>
	        
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"> 
				<select class="mdl-textfield__input" name = "categoria">
					<option value="null"> </option>
						<% 
	
						Connection con = null;
						ResultSet query = null;
						
						try{
							// Stabilisco la connessione con il database
							conn = SaveMySQL.getDBConnection();
							
						    PreparedStatement pst = conn.prepareStatement("SELECT * FROM CategoriaCucina;");
						    rs=pst.executeQuery();
						    
						     while(rs.next()){ // Scorro le righe
						          String id = rs.getString("IDCatCucina");
						          String name = rs.getString("Nome");
						%>
						<option value="<%=id%>"><%=name%></option>
						<%
						     }
						}
						catch(Exception e){    
							System.out.println(e.getMessage());
						}
						%>
						</select>
	      				<label class="mdl-textfield__label" for="nome">Categoria</label>
	        </div><br>
	        
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<textarea class="mdl-textfield__input" rows="3" cols="50" name = "descrizione"></textarea>
				<label class="mdl-textfield__label" for="nome">Descrizione</label>
			</div><br>
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<input type="checkbox" id="list-switch-1" class="mdl-switch__input" name = "ser-climatizzazione"/>	
				<label class="mdl-textfield__label" for="nome">Ser-Climatizzazione</label>
			</div>
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<input type="checkbox" id="list-switch-1" class="mdl-switch__input" name = "ser-animali"/>	
				<label class="mdl-textfield__label" for="nome">Ser-Animali</label>
			</div><br>
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input type="checkbox" id="list-switch-1" class="mdl-switch__input" name = "ser-wifi"/>		
				<label class="mdl-textfield__label" for="nome">Ser-Wifi</label>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">	 
				<input type="checkbox" id="list-switch-1" class="mdl-switch__input" name = "ser-disabili"/>	
				<label class="mdl-textfield__label" for="nome">Ser-Disabili</label>
			</div>
				
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input type="checkbox" id="list-switch-1" class="mdl-switch__input" name = "ser-parcheggio"/>
				<label class="mdl-textfield__label" for="nome">Parcheggio</label>
			</div><br>
			
			<input name="whatsend" value="aggiunginuovoristorante" type="hidden"/>	
	
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Aggiungi ristorante"/><br>
		</form>
	</div>

</body>
</html>