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
	<h2 align="left"><font><strong>Employees Table</strong></font></h2>
	<table align="left" cellpadding="5" cellspacing="5" border="1">
	<tr>
	
	</tr>
	<tr bgcolor="#73757a">
	<td><b>username</b></td>
	<td><b>firstame</b></td>
	<td><b>lastname</b></td>
	<td><b>email</b></td>
	<td><b>password</b></td>
	</tr>
	<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM employee";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
	%>
	<tr bgcolor="#7497ed">
	
	<td><%=resultSet.getString("username") %></td>
	<td><%=resultSet.getString("firstname") %></td>
	<td><%=resultSet.getString("lastname") %></td>
	<td><%=resultSet.getString("email") %></td>
	<td><%=resultSet.getString("password") %></td>
	
	</tr>
	
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table><br>
</div>
<div>
  <form action="http://localhost:9009/JavaMiniProject/adminoptions.jsp">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Back" name="home" />
      </form>
</div>