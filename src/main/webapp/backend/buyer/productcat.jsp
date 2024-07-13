<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Catalog</title>
    <style>
        .product-tile-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .product-tile {
            width: calc(20% - 0.25%);
            margin: 0.5%;
            padding: 1%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: #fff;
            text-align: center;
            transition: box-shadow 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
            font-family: 'Your Chosen Font', sans-serif;
        }

        .product-tile:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        }

        .product-image {
    		width: 100%;
    		max-height: 200px;
    		object-fit: cover;
    		border-radius: 10px 10px 0 0;
		}

        .product-info {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            justify-content: space-between;
            padding: 10px;
        }

        .product-title {
            font-weight: bold;
            margin: 10px 0;
            font-size: 16px;
        }

        .product-description {
            font-size: 11px;
            color: #555;
            margin: 5px 0;
        }

        .product-price {
            color: #e67e22;
            font-weight: bold;
            margin: 5px 0;
        }

        .product-button {
            width: 95%;
            margin-top:10px;
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

        .product-button:hover {
            background-color: #e67e22;
            color: #fff;
            text-decoration: none;
        }

        .cart-sidebar {
            width: calc(100% - 0.25%);
            margin: 0.5%;
            padding: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            background-color: #fff;
            text-align: center;
            transition: box-shadow 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
            font-family: 'Your Chosen Font', sans-serif;
            font-size: 14px;
            align-items: center; 
        }

        h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 5px 0;
            font-size: 11px;
        }

        button {
            width: 90%;
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ff9a4b;
        }

        input[type="number"] {
            width: 50px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            font-size: 12px;
        }
        
    </style>
    
</head>
<body>
    <!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    
    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/bnavbar.jsp" />
    
    
	<!-- Product tile for each product-->
    <div id="product-tile-container" class="product-tile-container">
    
	<c:forEach var="prod" items="${productDetails}">
    <div class="product-tile">
    	<!-- Product Image -->
        <img class="product-image" src="<%= request.getContextPath() %>${prod.image}" alt="${prod.id}">
        <!-- Product Info -->
        <div class="product-info">
            <div class="product-title">${prod.name}</div>
            <div class="product-description">${prod.description}</div>
            <div class="product-price">LKR <fmt:formatNumber type="currency" value="${prod.price}" currencySymbol=" "/></div>
        </div>
        
        <!-- Checkout Quantity Form -->
        <form action="checkout" method="post">
            <input type="hidden" name="productId" value="${prod.id}">
            <input type="hidden" name="price" value="${prod.price}">
            <input type="number" name="quantity" value="1" min="1" value=1>
            <input type="submit" value="Order" class="product-button">
            
            <!-- Setting Parameters -->
            <c:url value="checkout.jsp" var="check">
                <c:param name="prodId" value="${prod.id}"/>
                <c:param name="prodId" value="${prod.price}"/>
                <c:param name="prodId" value="quantity"/>
            </c:url>
        </form>
    </div>
	</c:forEach>
    </div>
</body>
</html>