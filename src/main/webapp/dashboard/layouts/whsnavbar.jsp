<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .secondary-navbar {
    	width: 95%;
        margin: 0 auto; 
        display: flex;
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
	<nav class="secondary-navbar">
        <a class="#" href="<%= request.getContextPath() %>/order_list">Approved Buyer Orders</a>
		<a href="<%= request.getContextPath() %>/stock_req">Request Stock</a>
        <a class="#" href="<%= request.getContextPath() %>/shipped_orders">Shipped Orders</a>
    </nav>
</body>
</html>