<%@page import="java.util.ArrayList"%>
<%@page import="ristoapp.db.SaveMySQL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ristoapp.bean.PiattiBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli Prenotazione</title>

<style type="text/css">
	.antemprima{
		width: auto;
		height: 100px;
	}
</style>
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
							<input name=<%=id%> type="number" max="15">
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
	<%if(Integer.parseInt(request.getSession().getAttribute("TipoPren").toString())!=3){ %>
	<form action="nuovaprenotazioneservlet" name="dettaglipren" method="POST">
			<input name="whatsend" value="nodettagli" type="hidden"><br>
		
			<input type = "submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" value = "Non ordinare ora"/><br><br>
	</form>
	<%} %>
	</center>
</body>
</html>