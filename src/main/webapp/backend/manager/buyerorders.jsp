<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buyer Orders</title>
    <style>
        body {
            font-family: 'Your Chosen Font', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        fieldset {
            border: 2px solid #e67e22;
            border-radius: 10px;
            padding: 20px;
            width: 80%;
            margin: 0 auto;
            margin-top: 20px;
        }
        legend {
            font-weight: bold;
            font-size: 24px;
            color: #e67e22;
        }
        table {
            width: 100%;
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
            width: 40%;
            background-color: transparent;
            color: #e67e22;
            text-align: center;
            padding: 10px;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #e67e22;
            border-radius: 10px;
            margin-bottom: 5px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s;
            display: inline-block;
        }
        input[type="button"]:hover {
            background-color: #e67e22;
            color: #fff;
            text-decoration: none;
        }
        
        .action-column {
    		width: 200px; 
		}
    </style>
</head>
<body>
	<!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    
    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/mnavbar.jsp" />
    <fieldset>
    	
        <legend>Pending Buyer Orders</legend>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Buyer</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Cost</th>
                <th class="action-column">Actions</th>
            </tr>
            <c:forEach items="${BuyerOrderList}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.created_at}</td>
                    <td>${order.username}</td>
                    <td>${order.pname}</td>
                    <td>${order.prodQty}</td>
                    <td>LKR <fmt:formatNumber type="currency" value="${order.total}" currencySymbol=" "/></td>
                    <!-- Approve Button -->
                    <td><a href="update_buyerorder_status?id=${order.id}&value=Approved"><input type="button" value="Approve"></a>
                    <!-- Reject Button -->
                    <a href="update_buyerorder_status?id=${order.id}&value=Rejected"><input type="button" value="Reject"></a></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>Approved Buyer Orders</legend>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Buyer</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Cost</th>
            </tr>
            <c:forEach items="${ApprovedBuyerOrderlist}" var="aorder">
                <tr>
                    <td>${aorder.id}</td>
                    <td>${aorder.created_at}</td>
                    <td>${aorder.username}</td>
                    <td>${aorder.pname}</td>
                    <td>${aorder.prodQty}</td>
                    <td>LKR <fmt:formatNumber type="currency" value="${aorder.total}" currencySymbol=" "/></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>Rejected Buyer Orders</legend>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Buyer</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Cost</th>
            </tr>
            <c:forEach items="${RejectedBuyerOrderlist}" var="rorder">
                <tr>
                    <td>${rorder.id}</td>
                    <td>${rorder.created_at}</td>
                    <td>${rorder.username}</td>
                    <td>${rorder.pname}</td>
                    <td>${rorder.prodQty}</td>
                    <td>LKR <fmt:formatNumber type="currency" value="${rorder.total}" currencySymbol=" "/></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
