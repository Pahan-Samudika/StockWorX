<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Stock</title>
    <style>
        body {
            font-family: 'Your Chosen Font', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
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
    </style>
</head>
<body>
    <!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />

    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/mnavbar.jsp" />

    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>No. of Available Units</th>
            <th>Availability</th>
        </tr>
        <c:forEach items="${StockDetails}" var="product">
            <!-- Availability Calculation -->
            <c:set var="availability" value="${(product.quantity * 100) / product.maxunits}" />
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.quantity} / ${product.maxunits}</td>
                <c:set var="availabilityColor">
                    <c:choose>
                        <c:when test="${availability < 30}">#fe654f</c:when>
                        <c:when test="${availability < 50}">#fac05e</c:when>
                        <c:otherwise>#acf7c1</c:otherwise>
                    </c:choose>
                </c:set>
                <td style="background-color: ${availabilityColor};">
                    <fmt:formatNumber value="${availability}" pattern="#0" />%
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
