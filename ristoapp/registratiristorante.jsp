<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form action = "registratiristoranteservlet" name = "account" method ="post">
		<table>
		<tr>
			<td>NomeRistorante:</td> 
			<td><input type = "text" name = "nome_ristorante"/></td>
		</tr>
		<tr>
			<td>Indirizzo: </td>
			<td><input type = "text" name = "indirizzo"/></td>
		</tr>
		<tr>
			<td>Telefono: </td>
			<td><input type = "text" name = "telefono"/></td>
		</tr>
		<tr>
			<td>Email: </td>
			<td><input type = "text" name = "email"/></td>
		</tr>
		<tr>
			<td>Comuni: </td>
			<td><select class="comuni">
	            <option value="null">-Select-</option>
	
	            <%
	                Connection con = null;
	                ResultSet rs = null;
	
	                try {
	                    Class.forName("com.mysql.jdbc.Driver");
	                    con = DriverManager.getConnection(
	                            "jdbc:mysql://localhost:3306/ristoappDB", "root", "12345");
	                } catch (Exception ex) {
	                    out.println("exxx " + ex);
	                }
	                try {
	                    PreparedStatement pst = con
	                            .prepareStatement("select name from Comuni");
	                    //pst.setString(1,uid);
	                    rs = pst.executeQuery();
	                    while (rs.next()) {
	                        String name = rs.getString("name");
	            %>
	            <option value="<%=name%>"><%=name%></option>
	            <%
	                }
	                } catch (Exception e) {
	                    out.print("error: " + e);
	                }
	            %>
	
	        </select></td>
        </tr>
		<tr>
			<td>Descrizione: </td>
			<td><textarea rows="3" cols="50" name = "descrizione"></textarea></td>
		</tr>
		<tr>	
			<td>Ser-Climatizzazione: </td>
			<td><input type = "checkbox" name = "ser-climatizzazione"/></td>
		</tr>
		<tr>	
			<td>Ser-Animali: </td>
			<td><input type = "checkbox" name = "ser-animali"/></td>
		</tr>
		<tr>	
			<td>Ser-Wifi: </td>
			<td><input type = "checkbox" name = "ser-wifi"/></td>
		</tr>
		<tr>	
			<td>Ser-Disabili: </td>
			<td><input type = "checkbox" name = "ser-disabili"/></td>
		</tr>
		<tr>	
			<td>Ser-Parcheggio: </td>
			<td><input type = "checkbox" name = "ser-parcheggio"/></td>
		</tr>	
		</table>
		<input type = "submit" value = "Registrati"/>
	</form>

</body>
</html>