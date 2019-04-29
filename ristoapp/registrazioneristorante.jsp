<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.ClientiBean"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Aggiungi piatto</title>
	<%@include file="graphicspuntoacca.jsp"%>
	<% 
	// Controllo se chi accede a questa pagina ha l'autorizzazione
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome();
  		if(cli.getLivAutorizzazioni() != 1){
  			// L'utente non è un ristoratore
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
	
</head>
<body class="text-center">

	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="login.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Registrazione ristorante</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="page">
	  
	  	<!-- PAGE CONTENT -->
		<form action = "registratiristoranteservlet" name = "account" method ="post">
			
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type = "text" name = "nome_ristorante" id="NomeRisto" required/>
							<label class="mdl-textfield__label" for="NomeRisto">Nome Ristorante</label>
						</div><br>
					
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type = "text" name = "indirizzo id="Indirizzo" required/>
							<label class="mdl-textfield__label" for="Indirizzo">Indirizzo</label>
						</div><br>
					
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						  <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name = "telefono id="Tell" required>
						  <label class="mdl-textfield__label" for="Tell">Telefono</label>
						  <span class="mdl-textfield__error">Input is not a number!</span>
						</div><br>
					
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label id="Email" >	 
							<input class="mdl-textfield__input" type = "text" name = "email" required/>	
							<label class="mdl-textfield__label" for="Email">Email</label>
						</div><br>
					
						<div class="mdc-select">
						 	<i class="mdc-select__dropdown-icon"></i>
						  	<select class="mdc-select__native-control" name = "comuni">
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
		        			<label class="mdc-floating-label">Comuni</label>
						    <div class="mdc-line-ripple"></div>
						</div><br>
	        		
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
						
  						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="number" name="quantity" min="0" max="100" step="1" value="30"> 
							<label class="mdl-textfield__label" for="sample4">Posti</label>
				 		</div>	<br>
				 			
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						    <input class="mdl-textfield__input" type="text" id="url" name="url">
						    <label class="mdl-textfield__label" for="url">URL http foto</label>
				  		</div><br>

						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						  <textarea class="mdl-textfield__input" type="text" rows= "3" id="AreaDescrizione" ></textarea>
						   <label class="mdl-textfield__label" for="AreaDescrizione">Descrizione...</label>
						 </div><br>
					
			
			<!-- ---------------------------------------CHECKBOX--------------------------------------------------- -->
	
					    <input type="checkbox" name="ser-climatizzazione">Ser-Climatizzazione
						<input type="checkbox" name="ser-animali">Ser-Animali
						<input type="checkbox" name="ser-wifi">Ser-Wifi
						<input type="checkbox" name="ser-disabili">Ser-Disabili
						<input type="checkbox" name="ser-parcheggio">Ser-Parcheggio
						
						<br><br>
					
						<input name="whatsend" value="aggiunginuovoristorante" type="hidden"/>	
				
						<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Aggiungi ristorante"/><br>
				
		</form>
	</div>
</body>
</html>