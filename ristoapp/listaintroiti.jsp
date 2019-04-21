<%@page import="ristoapp.bean.QueryIntroitiBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<%@include file="graphicspuntoacca.jsp"%>
		<style>
			a {color: black;}
			a:link {text-decoration: none;}
			a:visited {text-decoration: none;}
			a:hover {text-decoration: underline;}
			a:active {text-decoration: underline;}
		</style>
	</head>
	<body>
		<h5><a href="?scelta=listaintroiti">Introiti</a></h5>
		<div style="overflow-x:auto;">
			totale
			<table border="1" class="centratabella" style="width:80%;">
				<tr style="font-size: 18px;">
					<th>Nome</th>
					<th>Comune</th>
					<th>Stelle</th>
					<th>Ricavi</th>
				</tr>
				<%
				ArrayList<QueryIntroitiBean> informazioni = new ArrayList <QueryIntroitiBean>(); //lista delle info
				SaveMySQL prendiinfo = new SaveMySQL(); //per chiamare la funzione
				informazioni = prendiinfo.mostraIntroiti("totale"); //prendo le info degli introiti
				for(QueryIntroitiBean lista:informazioni){
					int IDRistorante = lista.getIDRistorante();
					String NomeRistorante = lista.getNome();
					String ComuneRistorante = lista.getComune();
					double Stelle = lista.getStelle();
					double Ricavi = lista.getRicavi();
					if(request.getParameter("ristorante") == null){%>
						<tr>
							<td><%=NomeRistorante%></td>
							<td><%=ComuneRistorante%></td>
							<td><%=Stelle%>&#9733;</td>
							<td>&euro; <%=Ricavi%></td>
						</tr>
					<%}
					else{//nel caso siamo nell'area "lista ristoranti"
						if(Integer.parseInt(request.getParameter("ristorante")) == IDRistorante){%>
							<tr>
								<td><%=NomeRistorante%></td>
								<td><%=ComuneRistorante%></td>
								<td><%=Stelle%>&#9733;</td>
								<td>&euro; <%=Ricavi%></td>
							</tr>
						<%}
					}
				} %>
			</table>
			<br/>oggi
			<table border="1" class="centratabella" style="width:80%;">
				<tr style="font-size: 18px;">
					<th>Nome</th>
					<th>Comune</th>
					<th>Stelle</th>
					<th>Ricavi</th>
				</tr>
				<%
				informazioni = prendiinfo.mostraIntroiti("oggi"); //prendo le info degli introiti
				for(QueryIntroitiBean lista:informazioni){
					int IDRistorante = lista.getIDRistorante();
					String NomeRistorante = lista.getNome();
					String ComuneRistorante = lista.getComune();
					double Stelle = lista.getStelle();
					double Ricavi = lista.getRicavi();
					if(request.getParameter("ristorante") == null){%>
						<tr>
							<td><%=NomeRistorante%></td>
							<td><%=ComuneRistorante%></td>
							<td><%=Stelle%>&#9733;</td>
							<td>&euro; <%=Ricavi%></td>
						</tr>
					<%}
					else{//nel caso siamo nell'area "lista ristoranti"
						if(Integer.parseInt(request.getParameter("ristorante")) == IDRistorante){%>
							<tr>
								<td><%=NomeRistorante%></td>
								<td><%=ComuneRistorante%></td>
								<td><%=Stelle%>&#9733;</td>
								<td>&euro; <%=Ricavi%></td>
							</tr>
						<%}
					}
				} %>
			</table>
			<br/>questo mese
			<table border="1" class="centratabella" style="width:80%;">
				<tr style="font-size: 18px;">
					<th>Nome</th>
					<th>Comune</th>
					<th>Stelle</th>
					<th>Ricavi</th>
				</tr>
				<%
				informazioni = prendiinfo.mostraIntroiti("mese"); //prendo le info degli introiti
				for(QueryIntroitiBean lista:informazioni){
					int IDRistorante = lista.getIDRistorante();
					String NomeRistorante = lista.getNome();
					String ComuneRistorante = lista.getComune();
					double Stelle = lista.getStelle();
					double Ricavi = lista.getRicavi();
					if(request.getParameter("ristorante") == null){%>
						<tr>
							<td><%=NomeRistorante%></td>
							<td><%=ComuneRistorante%></td>
							<td><%=Stelle%>&#9733;</td>
							<td>&euro; <%=Ricavi%></td>
						</tr>
					<%}
					else{//nel caso siamo nell'area "lista ristoranti"
						if(Integer.parseInt(request.getParameter("ristorante")) == IDRistorante){%>
							<tr>
								<td><%=NomeRistorante%></td>
								<td><%=ComuneRistorante%></td>
								<td><%=Stelle%>&#9733;</td>
								<td>&euro; <%=Ricavi%></td>
							</tr>
						<%}
					}
				} %>
			</table>
			<br/>quest'anno
			<table border="1" class="centratabella" style="width:80%;">
				<tr style="font-size: 18px;">
					<th>Nome</th>
					<th>Comune</th>
					<th>Stelle</th>
					<th>Ricavi</th>
				</tr>
				<%
				informazioni = prendiinfo.mostraIntroiti("anno"); //prendo le info degli introiti
				for(QueryIntroitiBean lista:informazioni){
					int IDRistorante = lista.getIDRistorante();
					String NomeRistorante = lista.getNome();
					String ComuneRistorante = lista.getComune();
					double Stelle = lista.getStelle();
					double Ricavi = lista.getRicavi();
					if(request.getParameter("ristorante") == null){%>
						<tr>
							<td><%=NomeRistorante%></td>
							<td><%=ComuneRistorante%></td>
							<td><%=Stelle%>&#9733;</td>
							<td>&euro; <%=Ricavi%></td>
						</tr>
					<%}
					else{//nel caso siamo nell'area "lista ristoranti"
						if(Integer.parseInt(request.getParameter("ristorante")) == IDRistorante){%>
							<tr>
								<td><%=NomeRistorante%></td>
								<td><%=ComuneRistorante%></td>
								<td><%=Stelle%>&#9733;</td>
								<td>&euro; <%=Ricavi%></td>
							</tr>
						<%}
					}
				} %>
			</table>
		</div>
	</body>
</html>