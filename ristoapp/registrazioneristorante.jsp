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
			  <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name = "telefono">
			  <label class="mdl-textfield__label" for="telefono">Telefono</label>
			  <span class="mdl-textfield__error">Input is not a number!</span>
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
	        
			<div class="mdc-select">
			 	<i class="mdc-select__dropdown-icon"></i>
			  	<select class="mdc-select__native-control" name = "categoria">
			    	<option value="" disabled selected></option>
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
			  <label class="mdc-floating-label">Categoria</label>
			  <div class="mdc-line-ripple"></div>
			</div>
	       <br>
			
			<div class="mdl-textfield mdl-js-textfield">
			   <textarea class="mdl-textfield__input" rows = "3" name = "descrizione" ></textarea>
			   <label class="mdl-textfield__label" for="nome">Descrizione...</label>
			 </div><br>
			
			<!-- ---------------------------------------CHECKBOX--------------------------------------------------- -->
			
			<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
			  <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" checked>
			  <span class="mdl-checkbox__label">Checkbox</span>
			</label>
			
		    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
			  <input type="checkbox" id="switch-1" class="mdl-switch__input" name = "ser-climatizzazione">
			  <span class="mdl-switch__label">Ser-Climatizzazione</span>
			</label>
			
			<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
			  <input type="checkbox" id="switch-2" class="mdl-switch__input" name = "ser-animali">
			  <span class="mdl-switch__label">Ser-Animali</span>
			</label>
			
			<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
			  <input type="checkbox" id="switch-3" class="mdl-switch__input" name = "ser-wifi">
			  <span class="mdl-switch__label">Ser-Wifi</span>
			</label>
			
			<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-4">
			  <input type="checkbox" id="switch-4" class="mdl-switch__input" name = "ser-disabili">
			  <span class="mdl-switch__label">Ser-Disabili</span>
			</label>
			
			<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-5">
			  <input type="checkbox" id="switch-5" class="mdl-switch__input" name = "ser-parcheggio">
			  <span class="mdl-switch__label">Ser-Parcheggio</span>
			</label>
			    
			<input name="whatsend" value="aggiunginuovoristorante" type="hidden"/>	
	
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Aggiungi ristorante"/><br>
		</form>
	</div>

</body>
</html>