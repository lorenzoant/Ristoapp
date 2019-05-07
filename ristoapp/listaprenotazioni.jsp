<%@page import="ristoapp.bean.RistorantiBean"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="ristoapp.bean.PrenotazioniBean"%>
 <%@page import="ristoapp.bean.ClientiBean"%>
 <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="graphicspuntoacca.jsp"%>
<title>Lista prenotazioni</title>

	<%// Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato
	
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome(); //nome del profilo
		
  		if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
  			response.sendRedirect("login.jsp");
  		}}%>

</head>
<body>
	
	
	<!-- PAGE CONTENT -->
	  	<div style="overflow-x: auto;">
		<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		<thead>
			<tr>
				<th>Data</th>
				<th>Ora</th>
				<th>Persone</th>
				<th>Stato pagamento</th>
				<th>Nome Ristorante</th>
				<th>Tipo prenotazione</th>
			</tr>
		</thead>
		<tbody>
	
		<%
				SaveMySQL db= new SaveMySQL();	
				ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");  
				ArrayList<PrenotazioniBean> prenotazioni = db.prelevaPrenotazioniCliente(cli);
				
				for(PrenotazioniBean p:prenotazioni){
					
					//Rivavo il nome del ristorante in modo strano
					ArrayList<RistorantiBean> risto = db.getInfoRistoID(p.getIDFRistorante());
					
					// Scritta per pagato
					String pagatoOut;
					if(p.getStatoPagamento()){
						pagatoOut = "<span style='color:green'>pagato</span>";
					}else{
						pagatoOut = "<span style='color:red'>non pagato</span>";
					}
					
					String catPren = "";
					if(p.getIDFCatPrenotazione() == 1) catPren = "Asporto";
					else if(p.getIDFCatPrenotazione() == 2) catPren = "Consegna a casa";
					else if(p.getIDFCatPrenotazione() == 3) catPren = "Al ristorante";
					%>
						<tr>
						<td><%=p.getData()%></td>
						<td><%=p.getOra()%></td>
						<td><%=p.getNumeroPersone()%></td>
						<td><%=pagatoOut%></td>
						<td><%=risto.get(0).getNome()%></td>
						<td><%=catPren%></td>
						<td>
							<form action="dettaglioPrenCliente" name="visualizzaDettPrenotazione" method="post">
							<input type="hidden" name="idPrenotazione" value="<%=p.getIDPrenotazione()%>"></input>
							<input type="hidden" name="whatsend" value="visualizzaDettPrenotazione"></input>
							<input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="Dettagli"/>
							</form>
						</td>
						<td>
							<!-- se la prenotazione non è stata pagata permetto al cliente di essere rimandato alla schermata di pagamento -->
							<a href="pagamento.jsp?idpren=<%= p.getIDPrenotazione() %>"><input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value="Paga ora"/></a>
						</tr>
					<%}%>
		</tbody>
		</table>
		</div>
	
	
</body>
</html>