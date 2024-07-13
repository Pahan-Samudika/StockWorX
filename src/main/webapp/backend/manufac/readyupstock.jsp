<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ready Up Stock Orders</title>
<style>
    body {
        font-family: 'Your Chosen Font', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        overflow: hidden;
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

    /* Style for the "Done" button */
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
	function msg1(){
		alert("Done Successfully!!")
	}
</script>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/manunavbar.jsp" />
    <fieldset>
        <legend>Ready Up Stock Orders</legend>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Ordered Date</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${ReadyStock}" var="stock">
                <tr>
                    <td>${stock.id}</td>
                    <td>${stock.pname}</td>
                    <td>${stock.prodQty}</td>
                    <td>${stock.created_at}</td>
                    <td><a href="update_stock_plus?prodId=${stock.prodId}&id=${stock.id}&newqty=${stock.newQuantity}"><input type="button" value="Done" onclick="msg1()"></a></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
