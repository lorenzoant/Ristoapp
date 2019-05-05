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
	<div  style="margin-bottom: 30px;">Seleziona i piatti che vuoi ordinare</div>
	<form action="nuovaprenotazioneservlet" name="dettaglipren" method="POST">
	<table>
	
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
							<%=Nome%>
						</td>
						<td>
							<%=Descrizione%>
						</td>
						<td>
							<%=Prezzo%>
						</td>
						<td>
							<%if(url!=""){ %>
							<img class="antemprima"	alt="Immagine del piatto" src="<%=url%>">
							<%} %>
						</td>
						<td>
							<input name=<%=id%> type="number" max="15" placeholder="Inserisci numero piatti">
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