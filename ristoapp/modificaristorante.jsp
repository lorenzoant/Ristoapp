<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@page import="ristoapp.bean.RistorantiBean"%>
<%@page import="ristoapp.bean.ClientiBean"%>

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
   
<%
	
	RistorantiBean ristorante = new RistorantiBean();
	
	//prendo i dati del ristorante dalla sessione
	ristorante = (RistorantiBean) request.getSession().getAttribute("MODIFICARISTORANTE");	
	
	boolean presenza = false;
	boolean climatizzazione = true;
	boolean animali = true;
	boolean wifi = true;
	boolean disabili = true;
	boolean parcheggio = true;
	int IDFCatCucina = 0;
	String Nome = "";
	double CoordinataLat = 0;
	double CoordinataLon = 0;
	String Indirizzo = "";
	String Telefono = "";
	String Email = "";
	String Comune = "";
	String Descrizione = "";
	int NumeroPosti = 0;
	String url="";
	
	
	//setto le variabili con i dati da sessione
	if (ristorante != null) {
		presenza = true;
		
		if(ristorante.getSerClimatizzazione() == false) climatizzazione = false;
		if(ristorante.getSerAnimali() == false) animali = false;
		if(ristorante.getSerWifi() == false) wifi = false;
		if(ristorante.getSerDisabili() == false) disabili = false;
		if(ristorante.getSerParcheggio() == false) parcheggio = false;
		IDFCatCucina = ristorante.getIDFCatCucina();
		Nome = ristorante.getNome();
		CoordinataLat = ristorante.getCoordinataLat();
		CoordinataLon = ristorante.getCoordinataLon();
		Indirizzo = ristorante.getIndirizzo();
		Telefono = ristorante.getTelefono();
		Email = ristorante.getEmail();
		Comune = ristorante.getComune();
		Descrizione = ristorante.getDescrizione();
		NumeroPosti = ristorante.getNumeroPosti();
		url = ristorante.getUrl();
		
	}


%>   

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modifica ristorante</title>
	<%@include file="graphicspuntoacca.jsp"%>
</head>
<body class="text-center">
	
	<div class="mdl-layout__header">
		<h2>RistoApp</h2>
	</div>
	
	<div class="page">
		<form action = "registratiristoranteservlet" name = "account" method ="post">
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "nome_ristorante" id="NomeRisto" value="<%= Nome %>" required/>
				<label class="mdl-textfield__label" for="NomeRisto">Nome Ristorante</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type = "text" name = "indirizzo id="Indirizzo" value="<%= Indirizzo %>" required/>
				<label class="mdl-textfield__label" for="Indirizzo">Indirizzo</label>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			  <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" name = "telefono id="Tell" value="<%= Telefono %>" required>
			  <label class="mdl-textfield__label" for="Tell">Telefono</label>
			  <span class="mdl-textfield__error">Input is not a number!</span>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label id="Email" >	 
				<input class="mdl-textfield__input" type = "text" name = "email" value="<%= Email %>" required/>	
				<label class="mdl-textfield__label" for="Email">Email</label>
			</div><br>		
			
			<div class="mdc-select">
			 	<i class="mdc-select__dropdown-icon"></i>
			  	<select class="mdc-select__native-control" name = "comuni">
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
								  if (name.equalsIgnoreCase(Comune)){
						%>
						<option value="<%=name%>" selected><%=name%></option>
						<%
								  }else{
						%>
						<option value="<%=name%>"><%=name%></option>
						<%
								  }
						     }
						}
						catch(Exception e){    
							System.out.println(e.getMessage());
						}
						%>
						</select>
	        			<label class="mdc-floating-label">Comuni</label>
			  <div class="mdc-line-ripple"></div>
			</div>
	        
			<div class="mdc-select">
			 	<i class="mdc-select__dropdown-icon"></i>
			  	<select class="mdc-select__native-control" name = "categoria">
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
						          if (Integer.parseInt(id) != IDFCatCucina){
						%>
						<option value="<%=id%>"><%=name%></option>
						<%
						          }else{
			  	    	 %>
						<option value="<%=id%>" selected><%=name%></option>
						<%
						          }
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
	       
	       <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input type="number" name="posti" min="0" max="100" step="1" value=<%= NumeroPosti%>> 
				<label class="mdl-textfield__label" for="sample4">Posti</label>
	 		</div>	<br>
	 			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="url" name="url"  value=<%= url%>>
			    <label class="mdl-textfield__label" for="url">URL http foto</label>
	  		</div><br>
			 
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			  	<textarea class="mdl-textfield__input" type="text" rows= "3" id="AreaDescrizione" value=""><%= Descrizione %>></textarea>
			    <label class="mdl-textfield__label" for="AreaDescrizione">Descrizione...</label>
			 </div><br>
			
			<!-- ---------------------------------------CHECKBOX--------------------------------------------------- -->
						
			<%if (climatizzazione == true){%>
		    		
		    	<input type="checkbox" name="ser-climatizzazione" checked>Ser-Climatizzazione

			<%}else{ %>
			
			
			
			<%} %>
			
			<%if (animali == true){%>
				
				<input type="checkbox" name="ser-animali" checked>Ser-Animali
				
			<%}else{ %>
			
				<input type="checkbox" name="ser-animali">Ser-Animali
			
			<%} %>
			
			<%if (wifi == true){%>
			
				<input type="checkbox" name="ser-wifi" checked>Ser-Wifi
			
			<%}else{ %>
			
				<input type="checkbox" name="ser-wifi">Ser-Wifi
			
			<%} %>
			
			<%if (disabili == true){%>
			
				<input type="checkbox" name="ser-disabili" checked>Ser-Disabili
			
			<%}else{ %>
			
				<input type="checkbox" name="ser-disabili">Ser-Disabili
			
			<%} %>
			
			<%if (parcheggio == true){%>
				
				<input type="checkbox" name="ser-parcheggio" checked>Ser-Parcheggio

			<%}else{ %>
				
				<input type="checkbox" name="ser-parcheggio">Ser-Parcheggio

			<%} %>
			    
			<input name="whatsend" value="modificaristorante" type="hidden"/>	
	
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "visualizza"/><br>
		</form>
	</div>

</body>
</html>