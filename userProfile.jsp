<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Make sure this path is correct -->
    <style>
        body {
            font-family: Arial, sans-serif; /* Consistent font for the page */
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left; /* Align text to the left within cells */
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #04AA6D;
            color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: calc(100% - 24px); /* Full width minus padding */
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box; /* Include padding and border in element's width */
        }
        input[type="submit"] {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;">User Profile</h1>

<form action="EditProfileServlet" method="post" style="width: 50%; margin: auto;">
    <table>
        <tr>
            <td>Username:</td>
            <td><input type="text" name="username" value="${user.username}" readonly></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email" value="${user.email}" required></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" placeholder="Enter new password" required></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="hidden" name="id" value="${user.id}">
                <input type="submit" value="Update Profile">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
