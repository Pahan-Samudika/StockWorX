<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
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

        input[type="radio"] {
            margin: 10px 0;
        }

        label {
            font-weight: bold;
        }

        textarea {
            width: 50%;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="hidden"] {
            display: none;
        }

        input[type="submit"] {
            width: 40%;
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

        input[type="submit"]:hover {
            background-color: #ff9a4b;
        }

        fieldset {
            border: 2px solid #e67e22;
            border-radius: 10px;
            padding: 20px;
            width: 80%;
            margin: 0 auto;
            margin-top: 50px;
        }

        legend {
            font-weight: bold;
            font-size: 24px;
            color: #e67e22;
        }

        .total-cost {
            font-weight: bold;
            font-size: 24px;
            color: #e67e22;
            text-align: center;
            margin-top: 20px;
        }

        input[type="button"] {
            width: 90%;
            margin-top: 10px;
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
        }

        input[type="button"]:hover {
            background-color: #e67e22;
            color: #fff;
            text-decoration: none;
        }

        p {
            font-weight: bold;
            font-size: 20px;
            color: #e67e22;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    
    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/bnavbar.jsp" />

    <fieldset>
        <legend>My Orders</legend>

        <table>
            <tr>
                <th>Order ID</th>
                <th>Ordered Date</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="ord" items="${MyBuyerOrderlist}">
                <tr>
                    <td>${ord.id}</td>
                    <td>${ord.created_at}</td>
                    <td>${ord.prodId}</td>
                    <td>${ord.prodQty}</td>
                    <td>${ord.status}</td>
                    <td>
                    	<!-- Cancel button -->
                        <a href="cancle_order?id=${ord.id}&value=Cancelled">
                            <input type="button" value="Cancel Order" />
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
