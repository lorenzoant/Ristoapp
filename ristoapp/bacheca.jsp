<%@page import="ristoapp.bean.ClientiBean"%>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.bean.RistorantiBean" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	//utente loggato
		ArrayList<RistorantiBean> rist = new ArrayList <RistorantiBean>(); //oggetto ristorante

		SaveMySQL save = new SaveMySQL(); //oggeto save
		rist = save.InformazioniRistorante(); //prendo tutti i ritoranti

%>
    
<!DOCTYPE html>
<!-- INIZIO CODICE  -->
	<html>

		<head>
			<meta name="viewport" content="width=device-width">
			<title>RistoApp-Bacheca </title>

			<%@include file="graphicspuntoacca.jsp"%>

			<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Bacheca</h2>
								</td>
								<td>
									<img class="logo" src="MEDIA/logo.png"/>
								</td>
							</tr>
						</table>
				</center>
			</div>

		</head>

	<body>
	
	<button id="demo-menu-lower-left" class="mdl-button mdl-js-button mdl-button--icon">
 		 <i class="material-icons">menu</i>
	</button>

	<ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect" for="demo-menu-lower-left">
	 	 <a class="mdl-menu__item" href="profilo.jsp">MyProfile [finire]</a>
	 	 <a class="mdl-menu__item" >Filter [fare]</a>
		  <a class="mdl-menu__item mdl-menu__item--full-bleed-divider" href="mappa.jsp"> Maps</a>
		  <a class="mdl-menu__item">Logout [fare]</a>
	</ul>

	<center>
		<table width="500px" border="1">
		<% for(RistorantiBean lista:rist){
				// int IDRistorante;
				 String NomeCatCucina = lista.getNomeCatCucina();
				 //int IDFCliente;
				 String Nome = lista.getNome(); //nome ristorante
				 //double CoordinataLat;
			     //double CoordinataLon;
				 String Indirizzo = lista.getIndirizzo();
				 String Telefono = lista.getTelefono();
				 String Email = lista.getEmail();
				 String Comune = lista.getComune();
				 String Descrizione = lista.getDescrizione();
				 Boolean SerClimatizzazione = lista.getSerClimatizzazione();
				 Boolean SerAnimali = lista.getSerAnimali();
				 Boolean SerWifi = lista.getSerWifi();
				 Boolean SerDisabili = lista.getSerDisabili();
				 Boolean SerParcheggio = lista.getSerParcheggio();
			%>
			<tr >
			
				<td><%=Nome%></td>
				<td><%=NomeCatCucina %></td>
				<td><%=Indirizzo%></td>
				<td><%=Telefono%></td>
				<td><%=Email%></td>
				<td><%=Comune%></td>
				<td><%=Descrizione%></td>
				<td><%=SerClimatizzazione%></td>
				<td><%=SerAnimali%></td>
				<td><%=SerWifi%></td>
				<td><%=SerDisabili%></td>
				<td><%=SerParcheggio%></td>
			
			</tr>
		<%
			}
		%>
		</table>
	</center>

</body>
	
</html>
