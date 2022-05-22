<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<title>-REGISTRATION-</title>
</head>
<body class="bg-gray-400">
<div class="bg-gray-400">
  <h2 class="text-4xl font-semibold border-b pb-2 mx-6">Registration</h2>
  <p class="bg-red-300 text-red-900 font-semibold text-xl w-80 rounded-lg my-2 mx-auto">${error }</p>
  <p class="bg-green-300 text-green-900 font-semibold text-xl w-80 rounded-lg my-2 mx-auto">${success }</p>
    <div class="bg-gray-600 mx-auto text-center w-1/2 py-5 shadow-xl rounded-3x1 my-55 max-w-2xl">
      <form name="myForm" action="http://localhost:9009/JavaMiniProject/empregister" method="post">
        <div class="grid grid-cols gap-0.2 my-5 mx-8">
          <label for="username" class="text-xl flex items-center">First name:</label>
          <input class="w-full p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="first" name="first"><br>
          
          <label for="username" class="text-xl flex items-center">Last name:</label>
          <input class="w-full p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="last" name="last"><br>

          <label for="username" class="text-xl flex items-center">Email Address:</label>
          <input class="w-full p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="email" name="email"><br>

          <label for="username" class="text-xl flex items-center">Username:</label>
          <input class="w-full p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="text" id="username" name="username"><br>

          <label for="username" class="text-xl flex items-center">Gender:</label>
          	<select class="bg-blue-200" name="gender">
          		<option>Select</option>
				<option>Male</option>
				<option>Female</option>
	 			<option>Other</option>
			</select>

          <label for="username" class="text-xl flex items-center">Password:</label>
          <input class="w-full p-1 border-2 placeholder-blue-800 bg-blue-200 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" type="password" id="pass" name="pass"><br>
        </div>
        <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="reset" value="Clear" name="clear" />
        <input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Register" name="submit" />
      </form><br>
      <form action="http://localhost:9009/JavaMiniProject/home">
      	<input class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white" type="submit" value="Home" name="home" />
      </form>
    </div>
</div></body>
</html>