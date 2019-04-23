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
	<table>
		<% 
			ArrayList<PiattiBean> rs;
			SaveMySQL db= new SaveMySQL();
			//int risto= Integer.parseInt(request.getSession().getAttribute("idristorante").toString());
			int risto=1;
			rs=  db.prelevaPiattRistorante(risto);
			
			for(int i=0; i<rs.size(); i++){
				if(rs.get(i).getDisponibile()==true){
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
				<%
				}
			}
			%>
	
	</table>
	</center>
</body>
</html>