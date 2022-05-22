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

  <div>
	<h2 align="left"><font><strong>All Products</strong></font></h2>
	<table align="left" cellpadding="5" cellspacing="5" border="1">
	<tr>
	
	</tr>
	<tr bgcolor="#73757a">
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
	<tr bgcolor="#7497ed">
	
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
  <form action="http://localhost:9009/JavaMiniProject/adminoptions.jsp">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Back" name="home" />
      </form>