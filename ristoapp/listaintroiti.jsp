<%@page import="ristoapp.bean.QueryIntroitiBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
		<%
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		//System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
		%>
		<div style="overflow-x:auto;">
			<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp centratabella" style="width:80%;"><!-- <table border="1" class="centratabella" style="width:80%;"> -->
				<!-- <tr style="font-size: 18px;"> -->
				<thead>
				  	<tr>
					    <th class="mdl-data-table__cell--non-numeric" style="text-align:right">Nome</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Comune</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Stelle</th>
						<th class="mdl-data-table__cell--non-numeric" style="text-align:right">Ricavi</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<QueryIntroitiBean> informazioni = new ArrayList <QueryIntroitiBean>(); //lista delle info
				SaveMySQL prendiinfo = new SaveMySQL(); //per chiamare la funzione
				String[] tempo = {"totale", "oggi", "mese", "anno"};
				for(int i = 0; i < 4; i++){
					informazioni = prendiinfo.mostraIntroiti(tempo[i], dateFormat.format(date)); //prendo le info degli introiti
					%>
					<tr><td colspan="4" style="text-align:center; font-weight: bold;"><%=tempo[i] %></td></tr>
					<%
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
					} 
				}%>
				</tbody>
			</table>
		</div>
	</body>
</html>