<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New User</title>
    <style>
    	/* Styling for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        /* Styling for the form */
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        /* Styling for form sections */
        form fieldset {
            border: 2px solid #e67e22;
            border-radius: 10px;
            padding: 20px;
        }
         /* Styling for form legend */
        form legend {
            font-weight: bold;
            font-size: 24px;
            color: #e67e22;
        }
         /* Styling for input fields and select */
        input[type="text"], input[type="password"], select {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
         /* Styling for buttons */
        input[type="button"], input[type="submit"] {
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
        /* Button hover effect */
        input[type="button"]:hover, input[type="submit"]:hover {
            background-color: #ff9a4b;
        }
        /* Styling for submit button */
        input[type="submit"] {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    <jsp:include page="../../dashboard/layouts/adnavbar.jsp" />
	<!-- Create the user input form -->
    <form action="<%= request.getContextPath() %>/user_insert" method="post">
        <fieldset>
        <!-- Section for User Details -->
            <legend>User Details</legend>
            <input type="text" name="username" id="username" placeholder="Username" required="required" oninput="validateUsername()" />
			<span id="usernameMessage"></span>
            <input type="password" id="password" name="password" placeholder="Password" required="required" />
            <br>
            <input type="password" id="confPassword" name="confirmPassword" placeholder="Confirm Password" required="required" onkeyup="validatePassword()" />
            <span id="confirmMessage"></span>
            <br>
            <input type="text" name="name" placeholder="Name" required="required" />
            <input type="text" name="email" id="email" placeholder="Email" required="required" oninput="validateEmail()" />
			<span id="emailMessage"></span>
            <input type="text" name="phone" placeholder="Phone" required="required" />
        </fieldset><br>
        <fieldset>
        <!-- Section for Assigning Roles -->
            <legend>Assign Roles</legend>
            <!-- Dropdown to select user role -->
            <select name="role">
                <option value="Buyer">Buyer</option>
                <option value="SalesManager">Sales Manager</option>
                <option value="Manager">Manager</option>
                <option value="WarehouseStaff">Warehouse Staff</option>
                <option value="Manufacturer">Manufacturer</option>
                <option value="Admin">Admin</option>
            </select>
        </fieldset>
        <!-- Submit button to add a new user -->
        <input type="submit" value="Add User" />
        <a href="<%= request.getContextPath() %>/view_user"><input type="button" value="Cancel"></a>
    </form>

    <script>
        function validatePassword() {
        	// Function to validate password match
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confPassword").value;
            var message = document.getElementById("confirmMessage");

            if (password === confirmPassword) {
                message.innerHTML = "Passwords match!";
                message.style.color = "green"; //if passwords match
            } else if (confirmPassword.length === 0 || password.length === 0) {
                message.innerHTML = ""; //if password or confirm password is empty
            } else {
                message.innerHTML = "Passwords do not match!";
                message.style.color = "red"; //if passwords do not match
             
            }
        }
        function validateEmail() {
        	// Function to validate email format
            var emailInput = document.getElementById("email");
            var emailMessage = document.getElementById("emailMessage");
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!emailPattern.test(emailInput.value)) {
                emailMessage.innerHTML = "Invalid email format";
                emailMessage.style.color = "red";
            } else {
                emailMessage.innerHTML = "";
            }
        }
        function validateUsername() {
        	// (existing code for username validation)
            var usernameInput = document.getElementById("username");
            var usernameMessage = document.getElementById("usernameMessage");
            var username = usernameInput.value;

            if (username.length < 4 || username.length > 20) {
                usernameMessage.innerHTML = "Username must be between 4 and 20 characters";
                usernameMessage.style.color = "red";
            } else {
                usernameMessage.innerHTML = "";
            }
        }
        
        
    </script>
</body>
</html>
