<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StockWorX Login</title>
<style>
    #logo {
        max-width: 70%;
        height: auto;
        padding: 20px;
    }

    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        margin: 0;
        background-color: #f9f9f9;
    }

    form {
    	display:block;
    	width:30%;
    	margin: 0 auto;
    	margin-top:10%;
    	justify-content: center;
        text-align: center;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    #un,
    #pw {
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 10px;
    }

    input[type="submit"] {
        width: 95%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #ff7900;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .legal-footer {
        background-color: #f9f9f9;
        margin-top: auto;
        color: #85878e;
        font-size: 12px;
        padding: 20px 0;
        width: 100%;
        text-align: center;
        font-family: Arial, sans-serif;
    }
</style>

</head>
<body>
	<!-- Login Form -->
    <form action="log" method="post">
        <img id="logo" src="<%= request.getContextPath() %>/images/logo/logo.png" alt="StockWorX Logo">
        <label id="un"></label><input type="text" placeholder="Username" name="username"><br>
        <label id="pw"></label><input type="password" placeholder="Password" name="password"><br>
        <input type="submit" name="submit" value="Login">
    </form>
    
    <p class="legal-footer">
    	A project by SE/OOP/2023/S2/MLB/WD/G159<br>
    	© <span id="year"></span> StockWorX online stock management system. All rights reserved.
	</p>
	
<c:if test="${loginError}">
	<script>
		//JavaScript
    	alert("Invalid Login Credentials"); // Display Invalid Login alert if loginError is true
	</script>
</c:if>

<c:if test="${logout}">
    <script>
  		//JavaScript
        alert("Logout Successfully"); // Display Logout Successfully alert if logout is true
    </script>
</c:if>
	<script>
    	// Setting the current year
    	document.getElementById("year").textContent = new Date().getFullYear();
	</script>

</body>
</html>
