<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
    <title>-All Product-</title>
  </head>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "miniproject";
String userId = "root";
String password = "Shivam@123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body class="bg-gray-400">
  <div class="mx-60 my-10 bg-gray-400">
	<h2 align="center" class="text-semibold text-2xl"><font><strong>All Products</strong></font></h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>
	
	</tr>
	<tr bgcolor="31906E">
	<td><b>PID</b></td>
	<td><b>Name</b></td>
	<td><b>Price</b></td>
	<td><b>Quantity</b></td>
	</tr>
	<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM product";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
	%>
	<tr bgcolor="#66CDAA">
	
	<td><%=resultSet.getInt(1) %></td>
	<td><%=resultSet.getString("name") %></td>
	<td><%=resultSet.getFloat(3) %></td>
	<td><%=resultSet.getInt(4) %></td>
	</tr>
	
	<% 
	}
	%>
	
	</table><br>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</div><br>
  <form class="text-center" action="http://localhost:9009/JavaMiniProject/adminoptions.jsp">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Back" name="home" />
      </form>
</body>
</html>