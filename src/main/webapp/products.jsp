<%@page import="java.sql.DriverManager"%> <%@page import="java.sql.ResultSet"%> <%@page import="java.sql.Statement"%> <%@page import="java.sql.Connection"%> <% String id = request.getParameter("userId"); String driverName = "com.mysql.jdbc.Driver"; String connectionUrl = "jdbc:mysql://localhost:3306/"; String dbName = "miniproject"; String userId = "root"; String password = "Shivam@123"; try { Class.forName(driverName); } catch (ClassNotFoundException e) { e.printStackTrace(); } Connection connection = null; Statement statement = null; ResultSet resultSet = null; %>

<html>
  <head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
    <title>-CART-</title>
  </head>
  <body class="bg-gray-400">
    <div class="bg-gray-400">
      <form action="http://localhost:9009/JavaMiniProject/sellproduct" method="post">
        <p class="my-2 mx-auto w-80 rounded-lg bg-red-300 text-xl font-semibold text-red-900">${error }</p>
        <label class="font-serif font-semibold" for="pid">Product ID:</label>
        <input class="w-40 appearance-none rounded-lg border-2 border-blue-700 bg-blue-200 p-1 placeholder-blue-800 focus:outline-none focus:ring-2" type="text" id="pid" name="pid" />
        <label class="font-serif font-semibold" for="quantity">Quantity:</label>
        <input class="w-40 appearance-none rounded-lg border-2 border-blue-700 bg-blue-200 p-1 placeholder-blue-800 focus:outline-none focus:ring-2" type="number" id="quantity" name="quantity" /><br />
        <br />
        <input class="rounded-lg bg-blue-300 px-4 py-1 text-xl font-semibold hover:bg-blue-800 hover:text-white" type="reset" value="Clear" name="clear" />
        <input class="rounded-lg bg-blue-300 px-4 py-1 text-xl font-semibold hover:bg-blue-800 hover:text-white" type="submit" value="Add" name="add" />
      </form>
      <br />

      <div class="mx-60 my-10 bg-gray-400">
        <h2 align="center" class="text-semibold text-2xl">
          <font><strong>Products</strong></font>
        </h2>
        <table align="center" cellpadding="5" cellspacing="5" border="1">
          <tr></tr>
          <tr bgcolor="31906E">
            <td><b>PID</b></td>
            <td><b>Name</b></td>
            <td><b>Price</b></td>
            <td><b>Quantity</b></td>
            <td><b>Total</b></td>
          </tr>
          <% try{ connection = DriverManager.getConnection(connectionUrl+dbName, userId, password); statement=connection.createStatement(); String sql ="SELECT * FROM bill"; resultSet = statement.executeQuery(sql); while(resultSet.next()){ %>
          <tr bgcolor="#66CDAA">
            <td><%=resultSet.getInt(1) %></td>
            <td><%=resultSet.getString("name") %></td>
            <td><%=resultSet.getFloat(3) %></td>
            <td><%=resultSet.getInt(4) %></td>
            <td><%=resultSet.getFloat(5) %></td>
          </tr>

          <% } } catch (Exception e) { e.printStackTrace(); } %>
        </table>
        <br />
      </div>

      <div>
        <form class="text-center" action="http://localhost:9009/JavaMiniProject/Bill.jsp" method="post">
          <input class="rounded-lg bg-blue-300 px-4 py-1 text-xl font-semibold hover:bg-blue-800 hover:text-white" type="submit" value="Generate Bill" name="add" />
        </form>
      </div>
    </div>
    <br>
    <form class="text-center" action="http://localhost:9009/JavaMiniProject/home">
      <input class="rounded-lg bg-blue-300 px-4 py-1 text-xl font-semibold hover:bg-blue-800 hover:text-white" type="submit" value="Home" name="home" />
    </form>
  </body>
</html>