<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	.indietro:hover{opacity: .5;}	
	.text-center {text-align: center;}
    .g-recaptcha {display: inline-block;}
    .page{margin: 15px;}
    .logo{width: 100px;}
    @media screen and (max-width:1024px){.mdl-layout__header{display:inline-block}
</style>
<link rel="icon" href="MEDIA/icona.ico"> <!-- icona in cima -->
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
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="custom-header mdl-layout__header mdl-layout__header--waterfall">
	<div class="mdl-layout__header-row">
		<div class="mdl-layout__header">
			<h2>titolo</h2>
		</div>
		<div class="mdl-layout-spacer"></div>
	</div>
	</header>
	<div class="mdl-layout__drawer">
		<span class="mdl-layout-title">Sidebar Menu</span>
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