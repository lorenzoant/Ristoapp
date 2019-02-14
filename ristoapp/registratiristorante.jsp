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
		NomeRistorante: <input type = "text" name = "nome_ristorante"/><br><br>
		Indirizzo: <input type = "text" name = "indirizzo"/><br><br>
		Telefono: <input type = "text" name = "telefono"/><br><br>
		Email: <input type = "text" name = "email"/><br><br>
		
		Comuni: <select class="comuni">
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

        </select><br><br>
        
		Descrizione: <input type = "text" name = "descrizione"/><br><br>
		Ser-Climatizzazione: <input type = "checkbox" name = "Ser-climatizzazione"/><br><br>
		Ser-Animali: <input type = "checkbox" name = "Ser-climatizzazione"/><br><br>
		Ser-Wifi: <input type = "checkbox" name = "Ser-climatizzazione"/><br><br>
		Ser-Disabili: <input type = "checkbox" name = "Ser-climatizzazione"/><br><br>
		Ser-Parcheggio: <input type = "checkbox" name = "Ser-climatizzazione"/><br><br>
		<input type = "submit" value = "Registrati"/>
	</form>

</body>
</html>