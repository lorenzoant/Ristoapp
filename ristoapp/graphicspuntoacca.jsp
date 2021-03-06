<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="MEDIA/icona.ico"> <!-- icona in cima -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.orange-red.min.css" /> 
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
	@font-face {
	  font-family: ristofont;
	  src: url(MEDIA/bahnschrift.ttf);
	}
	body,h1,h2,h3,h4,h5 {font-family: Bahnschrift SemiBold SemiConden, ristofont, sans-serif}
	.occhio{width: 25px; height: 20px;}
	.indietro{width: 70px; height: 70px;}
	.team{width:250px; height:250px; border-radius:100%;}
	.indietro:hover{opacity: .5;}	
	.text-center {text-align: center;}
    .g-recaptcha {display: inline-block;}
    .page{margin: 15px;}
    .logo{width: 80px;}
    .centratabella{width: 100%;margin-left: auto;margin-right: auto;} /*per evitare di mettere il tag center*/
    @media screen and (max-width:2048px){.mdl-layout__header{display:inline-block;}
    	
	.mappa{width:50%;height:300px;background: yellow; border: 2px solid grey;margin-top: 35px; margin-bottom: 35px; dispay: block;}
	.obbligatoria{margin-left: 250px; margin-right: 250px;}
	@media only screen and (max-width: 600px) {
		.mappa{width: 100%;}
		.separatore{width: 100%;}
		.obbligatoria{margin-left: 0; margin-right: 0;}
	}
</style>
<!--
ESEMPI:

header:
<div class="mdl-layout__header">
	<table style="width:100%">
		<tr>
			<td align="left"><a href="pagina di ritorno"><img class="indietro" src="MEDIA/indietro.png"/></a></td>
			<td align="center" style="width:100%">
				<h2 style="display: inline;vertical-align:middle">titolo</h2>
				<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
			</td>
		</tr>
	</table>
</div>

header con barra di navigazione:
<div class="mdl-layout mdl-js-layout">
	<header class="custom-header mdl-layout__header mdl-layout__header--waterfall">
		<div>
			<table style="width:100%">
				<tr>
					<td align="center" style="width:100%">
						<h2 style="display: inline;vertical-align:middle">Dashboard</h2>
						<img class="logo" style="vertical-align:middle" src="MEDIA/logo.png"/>
					</td>
				</tr>
			</table>
		</div>
	</header>
	<div class="mdl-layout__drawer">
		<h4 style="text-align:center;">Avanzate</h4><hr>
		<nav class="mdl-navigation">
		    <a class="mdl-navigation__link" href="">Link</a>
		    <a class="mdl-navigation__link" href="">Link</a>
		    <a class="mdl-navigation__link" href="">Link</a>
		    <a class="mdl-navigation__link" href="">Link</a>
	  	</nav>
	</div>
	<main class="mdl-layout__content">
		<div class="page-content">
			contenuto della pagina
		</div>
	</main>
</div>
 -->