<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    form {
        width: 80%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }

    select, textarea, input[type="submit"] {
        width: 95%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #e67e22;
        border-radius: 5px;
        font-size: 14px;
    }

    select {
        height: 40px;
    }

    textarea {
        height: 120px;
    }

    input[type="submit"] {
        background-color: #e67e22;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #ff9a4b;
    }
</style>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/whsnavbar.jsp" />
    <br><br>

    <form action="insert_stockreq" method="post">
        <select name="product">
            <c:forEach var="product" items="${prodDetails}">
                <option value="${product.id}">ID : ${product.id} - ${product.name}</option>
            </c:forEach>
        </select>
        <br>
        <textarea name="AdditionalNote" cols="50" rows="10" placeholder="Type additional note here...(optional)"></textarea>
        <br>
        <input type="submit" value="Place Stock Order" onclick="alert3()" onclick="alert3(event)"/>
        <script>
        //Validation
        function alert3(event){
     		if(confirm("Are you Confirm the Deletion?")){
     			alert("Submission directed to the Manager!");
     			
     		}
     		
     		else{
     			event.preventDefault();
     			alert("Submission Canceled!");
     		}
     	}
        
        </script>
    </form>
</body>
</html>
