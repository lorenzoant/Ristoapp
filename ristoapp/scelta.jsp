<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registrazione</title>
	<%@include file="graphicspuntoacca.jsp"%>
	</head>
	<style>
		.split {
		  height: 100%;
		  width: 50%;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  overflow-x: hidden;
		  padding-top: 20px;
		}
		
		.left {
		  left: 0;
		  background-color: #FE9A2E;
		}
		
		.right {
		  right: 0;
		  background-color: #FA8258;
		}
		
		.centered {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  text-align: center;
		}
		
		.centered img {
		  width: 150px;
		  border-radius: 50%;
		}
	</style>
	<body class="text-center">
		<center>
			<div class="mdl-layout__header">
				<center>
					<table>
						<tr>
							<td>
								<h2>Registrazione</h2>
							</td>
							<td>
								<img class="logo" src="MEDIA/logo.png"/>
							</td>
						</tr>
					</center>
				</table>
			</div>
			<div class="split left" style="margin-top: 10%;">
			  <div class="centered">
			    <img src="MEDIA/logo.png" alt="cliente">
			    <h5>"cliente"</h5>
			  </div>
			</div>
			
			<div class="split right" style="margin-top: 10%;">
			  <div class="centered">
			    <img src="MEDIA/logo.png" alt="Ristoratore">
			    <h5>"ristoratore"</h5>
			  </div>
			</div>
		</center>
	</body>
</html>