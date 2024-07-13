<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>

<!-- JavaScript function to show alert messages -->
<script>
    function showAlert(message) {
        alert(message);
    }
</script>
<style>
    body {
        font-family: 'Your Chosen Font', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    h2 {
        font-weight: bold;
        font-size: 24px;
        color: #e67e22;
        text-align: center;
        margin: 20px 0;
    }

    table {
        width: 90%;
        margin: 0 auto; 
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 5px;
        text-align: center;
    }

    th {
        background-color: #e67e22;
        color: #fff;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    input[type="radio"] {
        margin: 10px 0;
    }

    label {
        font-weight: bold;
    }

    input[type="hidden"] {
        display: none;
    }

    input[type="submit"]:hover {
        background-color: #ff9a4b;
    }

    input[type="button"] {
        width: 90%;
        margin: auto;
        background-color: transparent;
        color: #e67e22;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        border: 1px solid #e67e22;
        padding: 5px;
        cursor: pointer;
        transition: color 0.3s, background-color 0.3s;
    }

    .edit input[type="button"] {
        border-radius: 10px 10px 0px 0px;
    }

    .delete input[type="button"] {
        border-radius: 0px 0px 10px 10px;
    }

    .edit input[type="button"]:hover {
        background-color: #000000;
        color: #fff;
        text-decoration: none;
    }

    .delete input[type="button"]:hover {
        background-color: #ff001e;
        color: #fff;
        text-decoration: none;
    }
</style>
</head>
<body>
	 <!-- Including navigation bars from other JSP files -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/adnavbar.jsp" />
    <br><br>
    <!-- Creating a table to display user details -->
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${userDetails}">
         <!-- user details using JSTL forEach -->
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.phone}</td>
                <td>${user.role}</td>
                <td>
                	<!-- Buttons to edit and delete users -->
                    <a href="edit_user?id=${user.id}" class="edit"><input type="button" value="Edit"onclick="showAlert('Edit clicked for user ${user.id}')"></a><br>
                    <a href="delete_user?id=${user.id}" class="delete"><input type="button" value="Delete"onclick="showAlert('Delete clicked for user ${user.id}')"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

