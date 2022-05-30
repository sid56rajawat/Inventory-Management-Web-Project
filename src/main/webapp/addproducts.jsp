<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<title>-Products Inventory-</title>
</head>
<body class="bg-gray-400">
<form class="bg-gray-400" action="http://localhost:9009/JavaMiniProject/addproducts" method="post">
      <p class="bg-red-300 text-red-900 font-semibold text-xl w-80 rounded-lg my-2 mx-auto">${error }</p>
      <p class="bg-green-300 text-green-900 font-semibold text-xl w-80 rounded-lg my-2 mx-auto">${success }</p>
    <label class="font-serif font-semibold" for="pid">Product ID:</label>
	<input class="w-40 p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="pid" name="pid" />
	<label class="font-serif font-semibold" for="name">Name:</label>
	<input class="w-40 p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="name" name="name" />
	<label class="font-serif font-semibold" for="price">Price:</label>
	<input class="w-40 p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="price" name="price" />
    <label class="font-serif font-semibold" for="quantity">Quantity:</label>
    <input class="w-40 p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="number" id="quantity" name="quantity" /><br />   
	<br>
	<input class=" bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="reset" value="Clear" name="clear" />
    <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Add" name="add" />
  </form><br>
  <form action="http://localhost:9009/JavaMiniProject/adminoptions.jsp">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Back" name="home" />
      </form>

</body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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

  <div class="bg-gray-400 mx-60 my-36">
	<h2 align="center" class="text-2xl text-semibold"><font><strong>All Products</strong></font></h2>
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
</div><br>
  <!-- <form class="text-center" action="http://localhost:9009/JavaMiniProject/adminoptions.jsp">
        	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%><br><br>
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Back" name="home" />
      </form> -->
</html>