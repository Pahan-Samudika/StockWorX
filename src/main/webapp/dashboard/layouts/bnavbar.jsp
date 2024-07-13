<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .secondary-navbar {
    	width:95%;
        display: flex;
        margin: 0 auto; 
        margin-top:5px;
        margin-bottom:10px;
        justify-content: space-between;
        align-items: center;
        padding: 5px;
        background-color: #e67e22; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
        font-family: 'Your Chosen Font', sans-serif;
    }

    .secondary-navbar a {
        text-decoration: none;
        color: #fff;
        margin-right: 20px;
        font-weight: bold;
        font-size: 12px;
        padding:8px;
        
    }
</style>
</head>
<body>
    <div>
        <nav class="secondary-navbar">
            <a class="#" href="<%= request.getContextPath() %>/catalog">Product Catalog</a>
            <a class="#" href="<%= request.getContextPath() %>/my_orders">My Orders</a>
            <a class="#" href="<%= request.getContextPath() %>/feedback">Feedback</a>
        </nav>
    </div>
</body>
</html>
