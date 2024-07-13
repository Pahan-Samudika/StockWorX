<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <style>
        body {
            font-family: 'Your Chosen Font', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
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

        textarea {
            width: 95%; 
            margin:0 auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            float: right;
            background-color: #e67e22;
            color: #fff;
            text-align: center;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #ff9a4b;
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

        input[type="button"] {
            width: 40%;
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
    </style>
</head>
<body>
    <!-- Main Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/navbar1.jsp" />
    
    <!-- Secondary Navigation Bar -->
    <jsp:include page="../../dashboard/layouts/bnavbar.jsp" />

    <form action="<%= request.getContextPath() %>/feedback" method="post">
        <fieldset>
            <legend>Feedback</legend>
            <textarea name="feedback" placeholder="Type Message" rows="5" cols="50" required></textarea>
            <br>
            <input type="submit" value="Submit" />
        </fieldset>
    </form>
    <br>
    <fieldset>
        <legend>My Feedbacks</legend>

        <table>
            <tr>
                <th>Date</th>
                <th>Message</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="feed" items="${feedbackDetails}">
                <tr>
                    <td>${feed.created_at}</td>
                    <td>${feed.msg}</td>
                    <td>
                        <a href="delete_feedback?id=${feed.id}">
                            <input type="button" value="Delete" />
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
