<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approved Buyer Orders</title>
<style>

    body {
        font-family: 'Your Chosen Font', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    table {
        width: 95%;
        margin: 0 auto; 
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 15px;
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

    input[type="button"] {
        width: 90%;
        margin: auto;
        background-color: transparent;
        color: #e67e22;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        border: 1px solid #e67e22;
        padding: 10px;
        cursor: pointer;
        border-radius: 10px;
        transition: color 0.3s, background-color 0.3s;
        display: inline-block;
    }

    input[type="button"]:hover {
        background-color: #e67e22;
        color: #fff;
        text-decoration: none;
    }
</style>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/whsnavbar.jsp" />
    <br><br>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Ordered Date</th>
            <th>Buyer</th>
            <th>Order</th>
            <th>Total Cost</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${ApprovedBuyerOrderlist}" var="aorder">
            <tr>
                <td>${aorder.id}</td>
                <td>${aorder.created_at}</td>
                <td>${aorder.username}</td>
                <td>${aorder.pname} x ${aorder.prodQty}</td>
                <td>
                LKR <fmt:formatNumber type="currency" value="${aorder.total}" currencySymbol=" "/>
                </td>
                <td>
                <a href="update_stock_minus?id=${aorder.id}&prodId=${aorder.prodId}&newqty=${aorder.newQuantity}"><input type="button" value="Add to delivery queue" onclick="alert1()"/></a>
                <script>
             	function alert1(event){
             		alert("Successfully Added!");
             	}
                
                </script></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
