<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock Orders</title>
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
	<!--Java Scripts-->
	<script>
	function msg(event){
                    
		if(!confirm ("Are you sure you want to delete?")){
			event.preventDefault();
			alert("Deletion Cancelled!");      	
		}else{
			window.location.href = event.target.getAttribute("href");
			alert("Successfully Deleted!!");
		}
	}
</script>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/smnavbar.jsp" />
    <fieldset>
        <legend>Stock Orders</legend>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Ordered Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${StockOrders}" var="stock">
                <tr>
                    <td>${stock.id}</td>
                    <td>${stock.prodId}</td>
                    <td>${stock.prodQty}</td>
                    <td>${stock.created_at}</td>
                    <td>${stock.status}</td>
                    <td><a href="delete_stockorder?id=${stock.id}"><input type="button" value="Delete" onclick="msg(event)"></a></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
