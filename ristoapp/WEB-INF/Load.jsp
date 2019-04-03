<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="ristoapp.bean.ClientiBean"%>
    
    <%//riprendo la session da Login per avere i dati del cliente
		ClientiBean cli = (ClientiBean) request.getSession().getAttribute("CREDENZIALI");	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>loading</title>
</head>
<body>
	<div align="center">
	
	<form action = "LoadServlet" name = "Load" method ="post" onLoad="setTimeout('manda_form()',velocita*15)">

		<!-- <div style='font-size:8px; padding:1px; border:solid silver 2px; width:303px; color:#FFD350'''> -->
		
		<span id='progress1'>#</span>
		<span id='progress2'>#</span>
		<span id='progress3'>#</span>
		<span id='progress4'>#</span>
		<span id='progress5'>#</span>
		<span id='progress6'>#</span>
		<span id='progress7'>#</span>
		<span id='progress8'>#</span>
		<span id='progress9'>#</span>
		<span id='progress10'>#</span>
		<span id='progress11'>#</span>
		<span id='progress12'>#</span>
		<span id='progress13'>#</span>
		<span id='progress14'>#</span>
		<span id='progress15'>#</span>
		
		<input name = "whatsend"  value="fine" type="hidden">
		
		
		<%
		String problemi = (String)request.getAttribute("err");
		if(problemi == "err"){
		%>
		
		<h1>errore nel caricamento</h1>
		
		<%
		}
		%>
		
	</form>
		
	</div>

	<script>
	var fine = 15;		
	var colore = '#FFD350';	
	var velocita = 200;	
	
	var progressAt = fine;
	var progressTimer;
	
	function progress_clear() {
		for (var i = 1; i <= fine; i++){
			document.getElementById('progress'+i).style.backgroundColor = 'transparent';
		}
		progressAt = 0;
	}
	
	function progress_update() {
		progressAt++;
		
		if (progressAt > fine){
			progress_clear();
		}
		else document.getElementById('progress'+progressAt).style.backgroundColor = colore;
		progressTimer = setTimeout('progress_update()',velocita);
	}
	
	function progress_stop() {
		clearTimeout(progressTimer);
		progress_clear();
	}
	
	function manda_form(){
		document.load.submit("ristoapp/servlet/LoadServlet.java");
	}
	progress_update();		// start progress bar
	
	</script>
	<!-- </div> -->
	
</body>
</html>