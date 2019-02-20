<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="ISO-8859-1">
	<title>Sezione pagamento</title>
	
</head>

<body>

<form action="pagamentoservlet" name="pagamento" method="post">
		<div>PAN: <input name="pan" value="" type="text"/></div><br>
		<div>CVV: <input name="cvv" value="" type="text"/></div><br>
		<div>Data di scadenza: <input name="scadenza" value="" type="date"/></div><br>
		<input value="Procedi al pagamento" type="submit">
	</form>
	
</body>

</html>