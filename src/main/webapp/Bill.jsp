<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<title>-Your Bill-</title>
</head>
<body class="bg-gray-400">

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

  <div class="mx-60 my-36">
	<h2 align="center" class="text-2xl text-semibold"><font><strong>Your Bill</strong></font></h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>
	
	</tr>
	<tr bgcolor="31906E">
	<td><b>PID</b></td>
	<td><b>Name</b></td>
	<td><b>Price</b></td>
	<td><b>Quantity</b></td>
	<td><b>Total</b></td>
	</tr>
	<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM bill";
	float total=0;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		total+=resultSet.getFloat(5);
	%>
	<tr bgcolor="#66CDAA">
	
	<td><%=resultSet.getInt(1) %></td>
	<td><%=resultSet.getString("name") %></td>
	<td><%=resultSet.getFloat(3) %></td>
	<td><%=resultSet.getInt(4) %></td>
	<td><%=resultSet.getFloat(5) %></td>
	</tr>
	
	<% 
	}
	%>
	
	</table><br>
	<p class="text-right text-2xl text-semibold">Total :<%=total %></p>
	<br>
</div>
<br>
	<div class="text-center bg-blue-300">
  	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%><br><br>
  <form action="http://localhost:9009/JavaMiniProject/home">
      <input class="text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Home" name="home" />
  </form>
	</div>

</body>
</html>