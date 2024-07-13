<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock Requests</title>
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

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="number"] {
        width: 50px;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        font-weight: bold;
        font-size: 12px;
        margin-bottom: 10px;
    }

    input[type="submit"] {
        width: 80%;
        background-color: #e67e22;
        color: #fff;
        text-align: center;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #ff9a4b;
    }
</style>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/smnavbar.jsp" />
    <table>
        <tr>
            <th>Request ID</th>
            <th>Product ID</th>
            <th>Note</th>
            <th>Requested By</th>
            <th>Place Order</th>
        </tr>
        <c:forEach var="req" items="${StockReqList}">
            <tr>
                <td>${req.id}</td>
                <td>${req.prodId}</td>
                <td>${req.note}</td>
                <td>${req.requested_by}</td>
                <td>
                    <form action="insert_stockorder" method="post">
                        <input type="number" name="qty">
                        <input type="hidden" name="productId" value="${req.prodId}">
                        <input type="submit" value="Place Order">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
