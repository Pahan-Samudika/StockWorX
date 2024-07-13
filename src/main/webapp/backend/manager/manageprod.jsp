<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
    <style>
        body {
            font-family: 'Your Chosen Font', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 10px;
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
        
        .add-new {
            width: 80%;
            font-size:20px;
            margin: 0 auto;
            background-color: transparent;
            color: #e67e22;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #e67e22;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s;
        }

        .add-new:hover {
            background-color: #e67e22;
            color: #fff;
            text-decoration: none;
        }

        table {
            width: 100%;
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
        
        a{
        	text-decoration: none;
        }
        
        .action-column {
    		width: 150px; 
		}
		
		input[type="button"]{
		
		}
		.update-button {
			width: 90%;
            margin: 0 auto;
            background-color: transparent;
            color: #e67e22;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #e67e22;
            padding: 10px;
            border-radius: 10px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s;
        	border-radius: 10px 10px 0px 0px;
    	}

    	.delete-button {
    		width: 90%;
            margin: 0 auto;
            background-color: transparent;
            color: #e67e22;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            border: 1px solid #e67e22;
            padding: 10px;
            border-radius: 10px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s;
        	border-radius: 0px 0px 10px 10px;
   	 	}

    	.update-button:hover {
        	background-color: #000000;
        	color: #fff;
        	text-decoration: none;
    	}

    	.delete-button:hover {
        	background-color: #ff001e;
        	color: #fff;
        	text-decoration: none;
    	}
    </style>
    
    <!-- JavaScripts -->
    <script>
    	//Update Confirm Message
        function confirmUpdate(event) {
            if (!confirm("Are you sure you want to update this product?")) {
                event.preventDefault(); // Prevent the default link behavior
                alert("Update canceled.");
            } else {
                // If user clicks "OK" in the confirmation, you can proceed with the redirection
                window.location.href = event.target.getAttribute("href");
            }
        }
        
      //Delete Confirm Message
        function confirmDelete(event) {
            if (!confirm("Are you sure you want to delete this product?")) {
                event.preventDefault(); // Prevent the default link behavior
                alert("Deletion canceled.");
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

	<!-- Add new product Button -->
	<br><br>
    <a href="<%= request.getContextPath() %>/backend/manager/productinsert.jsp" style="display: flex; justify-content: center;">
        <input type="button" class="add-new" value="Add New Product">
    </a>
	<br>
    <fieldset>
        <legend>Product List</legend>
        
        <!-- Product Table -->
        
        <table>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Unit Price</th>
                <th>Category</th>
                <th>Available<br>Quantity</th>
                <th class="description">Description</th>
                <th>Action</th>
            </tr>
            <c:forEach var="product" items="${prodDetails}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>LKR <fmt:formatNumber type="currency" value="${product.price}" currencySymbol=" "/></td>
                    <td>${product.category}</td>
                    <td>${product.quantity}</td>
                    <td>${product.description}</td>
                    
                    <td class="action-column">
                    	<!-- Update Button -->
                        <a href="<%= request.getContextPath() %>/edit_product?productId=${product.id}" id="update" onclick="confirmUpdate(event);">
                            <input type="button" class="update-button" value="Update" ></a>
                        <br>
                        <!-- Delete Button -->
                        <a href="<%= request.getContextPath() %>/delete_product?productId=${product.id}" id="delete" onclick="confirmDelete(event)">
                            <input type="button" class="delete-button" value="Delete"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
