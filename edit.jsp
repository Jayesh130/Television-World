<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<h1>Edit A Record</h1>
<hr>
<%List<User> uList= (List<User>)request.getAttribute("userList"); %>
<form action="table" method="post">
<%for(User u: uList) {%>
ID: <input readonly='readonly' value='<%=u.getId() %>' name='id'><br><br>

Username:<input type='text' value='<%=u.getUsername()%>' name='username'><br><br>
<input type='submit' value="EDIT">
<% }%>
</form>



</body>
</html>