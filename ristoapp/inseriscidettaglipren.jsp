<%@page import="java.util.ArrayList"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ristoapp.bean.PiattiBean" import="ristoapp.bean.ClientiBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width">
<title>Dettagli Prenotazione</title>
<%@include file="graphicspuntoacca.jsp"%>

<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Prenotazione</h2>
								</td>
								<td>
									<img class="logo" src="MEDIA/logo.png"/>
								</td>
							</tr>
						</table>
				</center>
			</div>

<style type="text/css">
	.antemprima{
		width: auto;
		height: 100px;
	}
</style>

	<%// Controllo se chi accede a questa pagina ha l'autorizzazione o non si è loggato
	
	String nomeLoggato = "";
	if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
		ClientiBean cli = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
		nomeLoggato = cli.getNome(); //nome del profilo
		
  		if(cli.getLivAutorizzazioni() != 0){// L'utente non è un cliente
  			response.sendRedirect("login.jsp");
  		}%>
	<%}
	else{
		// L'utente non  loggato
		response.sendRedirect("login.jsp");
	}%>
</head>
<body>
<center>
	<form action="nuovaprenotazioneservlet" name="dettaglipren" method="POST">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
	
		<thead>
				<center>
					<h3>Seleziona i piatti che vuoi ordinare</h3>
				</center>
		</thead>
		<% 
			ArrayList<PiattiBean> rs;
			SaveMySQL db= new SaveMySQL();
			//int risto= Integer.parseInt(request.getSession().getAttribute("idristorante").toString());
			int risto=1;
			rs=  db.prelevaPiattRistorante(risto);
			
			for(int i=0; i<rs.size(); i++){
				
					if(rs.get(i).getDisponibile()==true){
						int id= rs.get(i).getIDPiatto();
						String Nome= rs.get(i).getNome();
						String Descrizione= rs.get(i).getDescrizione();
						double Prezzo= rs.get(i).getPrezzo();
						String url= rs.get(i).getUrl();
					%>
					<tr>
						<td>
							<center>
								<%=Nome%>
							</center>
						</td>
						<td>
							<center>
							<%=Descrizione%>
							</center>
						</td>
						<td>
							<center>
							<%=Prezzo%>
							</center>
						</td>
						<td>
							<center>
							<%if(url!=""){ %>
							<img class="antemprima"	alt="Immagine del piatto" src="<%=url%>">
							<%} %>
							</center>
						</td>
						<td>
							<center>
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
									<input class="mdl-textfield__input" name=<%=id%> type="number" max="15">
									<label class="mdl-textfield__label" for=<%=id%>>Inserisci numero piatti</label>
								</div>
							</center>
						</td>
					</tr>
					<%
					}
				
			}
			%>
			</table>
			<input name="whatsend" value="dettaglipren" type="hidden"><br>
		
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Prenota"/><br><br>
	</form>
	
	<!-- Nel caso il cliente non voglia ordinare i piatti online, può farlo solo se mangia al ristorante -->
	<%if(Integer.parseInt(request.getSession().getAttribute("TipoPren").toString())==3){ %>
	<form action="nuovaprenotazioneservlet" name="nodettagli" method="POST">
			<input name="whatsend" value="nodettagli" type="hidden"><br>
			
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Non ordinare ora"/><br><br>
	</form>
	<%} %>
	</center>
</body>
</html>