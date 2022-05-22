<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<title>-ADMIN PAGE-</title>
</head>
<body class="bg-gray-400">
<div class="bg-gray-400">
  <h2 class="text-4xl font-semibold border-b pb-2 mx-6">ADMIN PAGE</h2>
  <div class="bg-gray-600 mx-auto text-center w-1/2 py-5 shadow-xl rounded-3x1 my-64 max-w-2xl">
    <form class="py-1" action="http://localhost:9009/JavaMiniProject/emprec.jsp" method="get">
      <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="View Employee Record" name="emprec" />
    </form>
    <form class="py-1" action="http://localhost:9009/JavaMiniProject/empregister" method="get">
      <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Register Employee" name="reg" />
    </form>
    <form class="py-1" action="http://localhost:9009/JavaMiniProject/addproducts" method="get">  
      <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Manage Products" name="uppr" />
  	</form>
  	<form action="http://localhost:9009/JavaMiniProject/home">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Home" name="home" />
    </form>
  </div>
</div>

</body>
</html>