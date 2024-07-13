<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    .nav-body {
        font-family: 'Your Chosen Font', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    #logo {
        width: 100px;
        height: auto;
        padding: 20px;
    }

    .logout-button {
        width: 95%;
        background-color: #e67e22;
        color: #fff;
        text-align: center;
        padding: 10px;
        border: none;
        border-radius: 10px;
        margin-right: 40px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .logout-button:hover {
        background-color: #ff9a4b;
    }

    .navbar1 {
        display: grid;
        grid-template-columns: 80% 10% 10%;
        align-items: center;
        padding: 10px;
        padding-right: 40px;
        background-color: #f9f9f9;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 20px;
    }

    .navbar1 a {
        text-decoration: none;
        color: #333;
        margin-right: 30px;
        font-weight: bold;
        font-size: 16px;
    }

    .navbar1 img {
        width: 30px;
        height: auto;
    }

    .username {
        border-radius: 5px;
        color: #333;
        font-weight: bold;
        font-size: 20px;
        margin-right: 20px;
    }
</style>
</head>
<body>
<div class="nav-body">
    <nav class="navbar1">
        <a href="#"><img id="logo" src="<%= request.getContextPath() %>/images/logo/logo.png" alt="StockWorX Logo"></a>
        <div class="nav-profile">
            <div class="username"><%=session.getAttribute("username")%></div>
        </div>
        <div>
        	<a href="<%= request.getContextPath() %>/logout">
                <input type="button" value="Logout" class="logout-button">
       		</a>
       	</div>
    </nav>
</div>
</body>
</html>
