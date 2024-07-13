<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Queue</title>
<style>

    body {
        font-family: 'Your Chosen Font', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
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

    th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
        background-color: #e67e22;
        color: #fff;
        font-weight: bold;
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
<script>
	//Validation
	function alert2(event){
		if(confirm("Are you Confirm the Deletion?")){
		alert("Deletion Success!");
	}
	else{
		event.preventDefault();
		alert("Deletion Denied!");
	}
}
</script>
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
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${ApprovedBuyerOrderlist}" var="aorder">
            <tr>
                <td>${aorder.id}</td>
                <td>${aorder.created_at}</td>
                <td>${aorder.username}</td>
                <td>${aorder.pname} x ${aorder.prodQty}</td>
                <td>${aorder.deliveryAddress}</td>
                <td><a href="delete_buyerorder?id=${aorder.id}"><input type="button" value="Delete Order" onclick="alert2(event)"></a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
