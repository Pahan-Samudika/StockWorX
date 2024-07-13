<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Details</title>

 	<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        
        form fieldset {
            border: 2px solid #e67e22;
            border-radius: 10px;
            padding: 20px;
        }
        
        form legend {
            font-weight: bold;
            font-size: 24px;
            color: #e67e22;
        }
        
        input[type="text"], input[type="password"], select {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        input[type="button"], input[type="submit"] {
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        
        input[type="button"]:hover, input[type="submit"]:hover {
            background-color: #ff9a4b;
        }
        
        input[type="submit"] {
            margin-top: 20px;
        }
    </style>

<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confPassword").value;
        var message = document.getElementById("confirmMessage");

        if (password === confirmPassword) {
            message.innerHTML = "Passwords match!";
            message.style.color = "green"; //if passwords match
        } else if (confirmPassword.length === 0 || password.length === 0) {
            message.innerHTML = ""; //if password or confirm password is empty
        } else {
            message.innerHTML = "Passwords do not match!";
            message.style.color = "red"; //if passwords do not match
            event.preventDefault();
        }
    }
</script>

</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/adnavbar.jsp" />
	
    <c:forEach var="user" items="${useredit}">
    <form action="<%= request.getContextPath() %>/update_user" method="post">
        <fieldset>
            <legend>Edit User Details</legend>
            <input type="hidden" name="id" value="${user.id}"/>
            Username<input type="text" name="username" value="${user.username}" /><br>
            Password<input type="password" id="password" name="password" value="${user.password}" /><br>
            Confirm Password<input type="password" id="confPassword" name="confirmPassword" value="${user.password}" onkeyup="validatePassword()" />
            <span id="confirmMessage"></span>
            <br>
            Name<input type="text" name="name" value="${user.name}" /><br>
            Email<input type="text" name="email" value="${user.email}" /><br>
            Phone<input type="text" name="phone" value="${user.phone}" /><br>
        </fieldset><br>
        <fieldset>
            <legend>Edit Role</legend>
            <select name="role" value="${user.role}">
                <option value="Buyer" ${user.role == 'Buyer' ? 'selected' : ''}>Buyer</option>
                <option value="SalesManager" ${user.role == 'SalesManager' ? 'selected' : ''}>Sales Manager</option>
                <option value="Manager" ${user.role == 'Manager' ? 'selected' : ''}>Manager</option>
                <option value="WarehouseStaff" ${user.role == 'WarehouseStaff' ? 'selected' : ''}>Warehouse Staff</option>
                <option value="Manufacturer" ${user.role == 'Manufacturer' ? 'selected' : ''}>Manufacturer</option>
                <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
            </select>
        </fieldset>
        <input type="submit" value="Edit User Details" />
        <a href="<%= request.getContextPath() %>/view_user"><input type="button" value="Cancel"></a>
    </form>
    </c:forEach>
</body>
</html>

