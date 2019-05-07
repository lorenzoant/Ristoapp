<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="ISO-8859-1">
	<title>Sezione pagamento</title>
<%@include file="graphicspuntoacca.jsp"%>	
</head>

<body class="text-center">
	<div class="mdl-layout__header">		
		<table style="width:100%">
			<tr>
				<td align="left"><a href="bacheca.jsp"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
				<td align="center" style="width:100%">
					<h2 style="display: inline;vertical-align:middle">Aggiungi carta</h2>
					<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="page">
<form action="aggiungicartaservlet" name="pagamento" method="post">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <select class="mdl-textfield__input" id="categoria" name="categoria" required>
			<% 

		Connection conn = null;
		ResultSet rs = null;
		
		try{
			// Stabilisco la connessione con il database
			conn = SaveMySQL.getDBConnection();
			
		    PreparedStatement pst = conn.prepareStatement("SELECT * FROM CategoriaCarte;");
		    rs=pst.executeQuery();
		    
		     while(rs.next()){ // Scorro le righe
		    	 String id = rs.getString("IDCatCarta");
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
		<label class="mdl-textfield__label" for="categoria">Categoria</label>
		</div><br>
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="text" id="nomecarta" name="nomecarta" required>
			    <label class="mdl-textfield__label" for="nomecarta">Nome carta</label>
	  		</div><br>
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="number" id="pan" name="pan" required>
			    <label class="mdl-textfield__label" for="pan">PAN</label>
	  		</div><br>
	  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input class="mdl-textfield__input" type="number" id="cvv" name="cvv" required>
			    <label class="mdl-textfield__label" for="cvv">CVV</label>
			</div><br>
<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		<input class="mdl-textfield__input" name="data" value="" type="date" required/>
		<label class="mdl-textfield__label" for="data">Data scadenza</label>
		</div><br>
		
		<input name="whatsend" value="aggiunginuovacarta" type="hidden"/>
			
		<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Salva carta</button>
</form>
</div>	
</body>

</html>
