<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: 'Your Chosen Font', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        form {
            width: 60%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"], input[type="button"] {
            width: 100%;
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #ff9a4b;
        }
    </style>
    
    <!-- JavaScript -->
    <script>
    	//Function to validate whether input is an integer
        function validateInteger(inputElement) {
            const value = inputElement.value;
            const isValid = /^\d*$/.test(value);
            const errorMessage = document.getElementById("error-message");
            
            if (!isValid) {
                errorMessage.textContent = "* Please enter only integer values for Price, Quantity & Maximum Units";
            } else {
                errorMessage.textContent = "";
            }
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
    <jsp:include page="../../dashboard/layouts/mnavbar.jsp" />
    
	<c:forEach var="prod" items="${prodDetails}">
	<!-- Edit Product Form -->
    <form action="<%= request.getContextPath() %>/update_product" method="post">
    
    	<input type="hidden" name="id" value="${prod.id}"/>
    	<!-- Product Name Input -->
        Product Name <input type="text" name="name" value="${prod.name}" /><br>
        <!-- Product Price Input -->
        Price <input type="text" name="price" value="${prod.price}" onkeyup="validateInteger(this);" required/><br>
        <!-- Product Quantity Input -->
        Quantity <input type="text" name="quantity" value="${prod.quantity}" onkeyup="validateInteger(this);" required/>
        <!-- Product Max Quantity Input -->
        Maximum Quantity <input type="text" name="maxunits" value="${prod.maxunits}" onkeyup="validateInteger(this);" required/><br>
        <!-- Product Category Input -->
        Category <input type="text" name="category" value="${prod.category}" /><br>
        <!-- Product Description Input -->
        Description <textarea cols="60" rows="5" name="description">${prod.description}</textarea>
        
        <!-- Submit Button -->
        <input type="submit" value="Edit Product" /><br><br>
        <!-- Cancel Button -->
        <a href="<%= request.getContextPath() %>/view_products"><input type="button" value="Cancel" onclick="confirmCancel(event);"></a>
    </form>
    </c:forEach>
</body>
</html>
