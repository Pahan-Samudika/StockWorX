<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
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
        margin: 10px 0;
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
        margin: 15px 30px;
        margin-top: 10px;
        display: block;
        margin: 0 auto;
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
        text-align: center;
    }

    legend {
        font-weight: bold;
        font-size: 32px;
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
        width: 40%;
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
        margin: 15px 30px;
        display: block;
        margin: 0 auto;
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

    span#address {
        display: block;
        text-align: center;
    }
    
    a {
    	text-decoration: none;
    }
</style>
<script>
		//Cancel Confirm Message
		function confirmCheckout(event) {
		if (!confirm("Are you sure you want to purchase?")) {
			event.preventDefault(); // Prevent the default link behavior
		} else {
			// If user clicks "OK" in the confirmation, you can proceed with the redirection
			window.location.href = event.target.getAttribute("href");
		}
		
		//Cancel Confirm Message
		function confirmCancel(event) {
    	if (!confirm("Are you sure you want to cancel?")) {
        	event.preventDefault(); // Prevent the default link behavior
    	} else {
        	// If user clicks "OK" in the confirmation, you can proceed with the redirection
        	window.location.href = event.target.getAttribute("href");
    	}
}
</script>
</head>
<body>
	<!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    
    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/bnavbar.jsp" />
    <div>
        <fieldset>
            <legend>Checkout</legend>

            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                </tr>
                <tr>
                    <td>${order.pname}</td>
                    <td>${order.prodQty}</td>
                    <td>LKR <fmt:formatNumber type="currency" value="${order.prodPrice}" currencySymbol=" " /></td>
                </tr>
            </table><br>

            <p>Total Payment: LKR <fmt:formatNumber type="currency" value="${order.total}" currencySymbol=" " /></p>
            <br>
            <!-- Insert Order Form -->
            <form action="insert_order" method="post">
          
                <input type="hidden" name="productID" value="${order.prodId}">
                
                <input type="hidden" name="productname" value="${order.pname}">
                
                <input type="hidden" name="qty" value="${order.prodQty}">
                
                <input type="hidden" name="cost" value="${order.total}">

                <input type="radio" id="card" name="paymethod" value="Card Payment" onselect="askAddress()">
                <label for="card">Card Payment</label>
                
                <input type="radio" id="cod" name="paymethod" value="CashOnDelivery">
                <label for="cod">Cash-on Delivery</label><br>
                
                <span id="address"><textarea name="address" placeholder="Enter address here" rows="5"></textarea></span><br>
                <input type="hidden" name="action" value="checkout">
                
                <!-- Submit Button -->
                <input type="submit" value="Checkout" onclick="confirmCheckout(event);"><br>
                <!-- Cancel Button -->
                <a href="<%= request.getContextPath() %>/catalog"><input type="button" value="Cancel" onclick="confirmCancel(event);"></a>
            </form>
        </fieldset>
    </div>
</body>
</html>
