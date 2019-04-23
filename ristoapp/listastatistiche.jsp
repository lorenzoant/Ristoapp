<%@page import="ristoapp.bean.QueryStatisticheBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ristoapp.db.SaveMySQL" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 
	ArrayList<QueryStatisticheBean> statistiche = new ArrayList <QueryStatisticheBean>(); //oggetto query statistiche
	SaveMySQL ottieni = new SaveMySQL();
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<%@include file="graphicspuntoacca.jsp"%>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    	google.charts.load('current', {'packages':['corechart']});
	    	google.charts.setOnLoadCallback(torta3d);
	    	function torta3d() {
				var data = google.visualization.arrayToDataTable([
		    		['Prenotazioni', 'Numero per comune'],
			    	<%
			    	statistiche = ottieni.ottieniStatistiche("prenotazioni"); //statistiche prenotazioni per comune
			    	for(QueryStatisticheBean lista:statistiche){
			    		String comune = lista.getComune();
			    		int numprenotazioni = lista.getNumPrenotazioni();
			    		%>
							['<%=comune %>',<%=numprenotazioni %>],
					<%}%>
				]);
			  	var options = {
			    	//title: 'Prenotazioni per comune',
			    	is3D: true,
	        	};
	        	var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	        	chart.draw(data, options);
	    	}
	    	
	    	google.charts.load('current', {'packages':['bar']});
	        google.charts.setOnLoadCallback(barre);
	        function barre() {
	          var data = google.visualization.arrayToDataTable([
	            ['Mese/Anno', 'Ristoranti', 'Clienti'],
	            <%
		    	statistiche = ottieni.ottieniStatistiche("dataprimaregistrazione"); //data prima registrazione
		    	Date primaregistrazione = statistiche.get(0).getDataRegistrazione();
		    	//System.out.println("primaregistrazione="+primaregistrazione);
		    	
		    	statistiche = ottieni.ottieniStatistiche("dataultimaregistrazione"); //data ultima registrazione
		    	Date ultimaregistrazione = statistiche.get(0).getDataRegistrazione();;
		    	//System.out.println("ultimaregistrazione="+ultimaregistrazione);
		    	
		    	SimpleDateFormat MM = new SimpleDateFormat("MM");
				int primomese = Integer.parseInt(MM.format(primaregistrazione));
				int ultimomese = Integer.parseInt(MM.format(ultimaregistrazione));
				
				SimpleDateFormat YYYY = new SimpleDateFormat("yyyy");
				int primoanno = Integer.parseInt(YYYY.format(primaregistrazione));
				int ultimoanno = Integer.parseInt(YYYY.format(ultimaregistrazione));
				int nummesi = 0; //perchè metto ultimomese + 1
				
				while(primomese != ultimomese + 1 || primoanno != ultimoanno){
					if(primomese != 12) primomese++;
					else{
						primomese = 1;
						primoanno++;
					}
					nummesi++;
				}
				//System.out.println("nummesi= "+nummesi);
				int[][] risultati = new int[nummesi][4];//righe = nummesi, colonne = mese,anno,numregris,numregcli
				primomese = Integer.parseInt(MM.format(primaregistrazione));
				primoanno = Integer.parseInt(YYYY.format(primaregistrazione));
				int i = 0;
				
				while(primomese != ultimomese + 1 || primoanno != ultimoanno){//inserisco mese e anno nella matrice, e già che ci sono anche le registrazioni dei ristoranti
					//System.out.println(primomese + " "+ i);
					risultati[i][0] = primomese;
					risultati[i][1] = primoanno;
					i++;
					
					if(primomese != 12) primomese++;
					else{
						primomese = 1;
						primoanno++;
					}
				}
				
				int totale = 0;
				statistiche = ottieni.ottieniStatistiche("registrazioniristoranti");
	    		for(QueryStatisticheBean lista:statistiche){
	    			for(i = 0; i < nummesi; i++){
	    				//System.out.println(lista.getMese()+"/"+lista.getAnno()+"  "+risultati[i][0]+"/"+risultati[i][1]);
	    				if(risultati[i][0] == lista.getMese() && risultati[i][1] == lista.getAnno())risultati[i][2] = lista.getNumRegistrazioni();
	    			}
	    			totale += lista.getNumRegistrazioni();
				}
	    		
	    		statistiche = ottieni.ottieniStatistiche("registrazioniclienti");
	    		for(QueryStatisticheBean lista:statistiche){
	    			for(i = 0; i < nummesi; i++){
	    				//System.out.println(lista.getMese()+"/"+lista.getAnno()+"  "+risultati[i][0]+"/"+risultati[i][1]);
	    				if(risultati[i][0] == lista.getMese() && risultati[i][1] == lista.getAnno())risultati[i][3] = lista.getNumRegistrazioni();
	    			}
	    			totale += lista.getNumRegistrazioni();
				}
				
		    	for(i = 0; i < nummesi; i++){
	    		%>
					['<%=risultati[i][0] %>/<%=risultati[i][1] %>', <%=risultati[i][2] %>, <%=risultati[i][3] %>],
					//mese					anno					n regist ristoranti		n regist clienti
				<%
				}%>
	          ]);
	          var options = {
	            chart: {
	              //title: 'Registrazioni per mese/anno',
	              //subtitle: 'Ristoranti & clienti (tot = <%=totale %>)',
	            }
	          };
	          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	          chart.draw(data, google.charts.Bar.convertOptions(options));
	        }
	    </script>
		<style>
			a {color: black;}
			a:link {text-decoration: none;}
			a:visited {text-decoration: none;}
			a:hover {text-decoration: underline;}
			a:active {text-decoration: underline;}
		</style>
	</head>
	<body class="text-align">
		<h5><a href="?scelta=listastatistiche">Statistiche</a></h5>
		<hr>
		<h5>Prenotazioni per comune</h5>
	    <div id="piechart_3d" style="width: 80%; height: 400px; display: block; margin: 0 auto;"></div>
	    <hr>
	    <h5>Registrazioni per mese/anno</h5>
	    totale registrazioni = <%=totale %>
	    <div id="columnchart_material" style="width: 80%; height: 400px; display: block; margin: 0 auto;"></div>
	</body>
</html>