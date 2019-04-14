<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="ristoapp.bean.ClientiBean"%>

<%
ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	//utente loggato
%>
<!DOCTYPE html>
<html>
		<head>
			<meta name="viewport" content="width=device-width">
			<title>Il mio profilo </title>

			<%@include file="graphicspuntoacca.jsp"%>

			<div class="mdl-layout__header">
				<center>
						<table>
							<tr>
								<td>
									<h2>RistoApp - Il mio Profilo</h2>
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
	 	 <a class="mdl-menu__item" href="bacheca.jsp">Home</a>
	 	 <a class="mdl-menu__item">Logout [fare]</a>
	</ul>
<center>
	<table>
		<style>
		<tr>
			<td>
			.demo-card-image.mdl-card {
			  width: 256px;
			  height: 256px;
			  background: url('../ristoapp/MEDIA/profilo.jpg') center / cover;
			}
			.demo-card-image > .mdl-card__actions {
			  height: 52px;
			  padding: 16px;
			  background: rgba(0, 0, 0, 0.2);
			}
			.demo-card-image__filename {
			  color: #fff;
			  font-size: 14px;
			  font-weight: 500;
			}
			</style>
			
			<div class="demo-card-image mdl-card mdl-shadow--2dp">
			  <div class="mdl-card__title mdl-card--expand"></div>
			  <div class="mdl-card__actions">
			    <span class="demo-card-image__filename">Image.jpg</span>
			  </div>
			</div>
			
			</td>
			
			<td>
		<div class="mdl-card mdl-shadow--4dp">
		  <div class="mdl-card__media"><img src="skytower.jpg" width="173" height="157" border="0" alt="" style="padding:10px;">
		  </div>
		  <div class="mdl-card__supporting-text">
		   Accesso e impostazioni di sicurezza
		  </div>
		  <div class="mdl-card__supporting-text">
		  Modifica il login, il nome e altre cose
		  </div>
		</div>
		</td>
		</tr>
		<tr>
		<td></td>
		<td></td>
		</tr>
	</table>
</center>

</body>
</html>