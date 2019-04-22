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
		<h5><a href="?scelta=listastatistiche">Statistiche</a></h5>
		<div style="overflow-x:auto;">
			  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div"></div>
		</div>
	</body>
	<script>
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

	      var data = google.visualization.arrayToDataTable([
	        ['City', '2010 Population',],
	        ['New York City, NY', 8175000],
	        ['Los Angeles, CA', 3792000],
	        ['Chicago, IL', 2695000],
	        ['Houston, TX', 2099000],
	        ['Philadelphia, PA', 1526000]
	      ]);

	      var options = {
	        title: 'Population of Largest U.S. Cities',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: 'Total Population',
	          minValue: 0
	        },
	        vAxis: {
	          title: 'City'
	        }
	      };

	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

	      chart.draw(data, options);
	    }
	</script>
</html>