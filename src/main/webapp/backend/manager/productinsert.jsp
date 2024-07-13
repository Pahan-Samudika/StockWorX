<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
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
            width: 95%;
            margin: 0 auto;
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
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"], input[type="button"] {
            width: 95%;
            background-color: #e67e22;
            margin:10px;
            color: #fff;
            text-align: center;
            margin: 10px 0;
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

        .error-message {
            color: #ff0000;
            font-weight: bold;
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

	<!-- Insert Product Form -->
    <form action="<%= request.getContextPath() %>/insert_product" method="post" enctype="multipart/form-data">
    	<!-- Product Name Input -->
        <input type="text" name="name" placeholder="Product Name" required/><br>
        <!-- Product Price Input -->
        <input type="text" name="price" placeholder="Product Price" onkeyup="validateInteger(this);" required/><br>
        <!-- Product Quantity Input -->
        <input type="text" name="quantity" placeholder="Product Quantity" onkeyup="validateInteger(this);" required/>
        <!-- Product Max Quantity Input -->
        <input type="text" name="maxunits" placeholder="Maximum Units" onkeyup="validateInteger(this);" required/><br>
        <!-- Product Category Input -->
        <input type="text" name="category" placeholder="Product Category" required/><br>
        <!-- Product Description Input -->
        <textarea cols="60" rows="5" name="description" placeholder="Description"></textarea><br><br>
        <!-- Product image Input -->
        <input type="file" name="image" /><br>
        
        <!-- error-message output -->
        <div class="error-message" id="error-message"></div><br>
        
        <!-- Submit button -->
        <input type="submit" value="Add Product" /><br>
        <!-- Cancel button -->
        <a href="<%= request.getContextPath() %>/view_products"><input type="button" value="Cancel" onclick="confirmCancel(event);"></a>
    </form>
</body>
</html>
