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
			<td><select>
				<option value="null">-Select-</option>
					<% 
					Connection con=null;
					ResultSet rs=null;
					
					try
					{
					     Class.forName("com.mysql.jdbc.Driver");
					     con=DriverManager.getConnection("jdbc:mysql://lorenzoantoniazzi.ddns.net/theristoapp", "ristoapp", "$@x9Wq7XTjN#-J^v");
					     HttpSession ss=request.getSession();
					     String uid=(String)ss.getAttribute("id");
					     PreparedStatement pst=con.prepareStatement("SELECT * FROM Comuni WHERE ID = ID;");
					     //pst.setString(1,uid);
					     rs=pst.executeQuery();
					     while(rs.next())
					     {
					          String name = rs.getString("Nome");
					%>
					          <option value="x"><%=name%></option>
					<%
					     }
					}catch(Exception e)
					{    
						System.out.println(e.getMessage());
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