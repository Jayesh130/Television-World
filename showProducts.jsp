<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Products</title>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<style>
h3.alert {
  color: #cc3300;
  text-align: center;
}

h3.success {
  color: #009933;
  text-align: center;
}

h1 {
  color: white;
  text-align: center;
  font-size: 30px;
  background-color: #333;
  padding: 10px;
  margin: 0;
}

table {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

td, th {
  border: 1px solid #ddd;
  padding: 8px;
}

th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: black;
}

tr:hover {
  background-color: #f5f5f5;
}
a{
  text-decoration:none;
}
a.edit-link {
  color: #007bff;
  text-decoration: none;
}

a.edit-link:hover {
  text-decoration: underline;
}
.header {
	background-color: #04AA6D;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 0 30px;
	text-align: center;
}
.header a{
	color: black;
}
.fa-arrow-circle-left, .fa-arrow-alt-circle-right {
	margin-right: 10px;
	font-size: 24px;
}
</style>
</head>
<body>
<div class="header">
		<h2><a class="back" href="adminDash.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
	</div>
    <h1>All Products &amp; Edit Products <i class='fab fa-elementor'></i></h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Image</th>
            <th>Edit<i class='fas fa-pen-fancy'></i></th>
            <th>Delete<i class='fas fa-pen-fancy'></i></th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.productName}</td>
                <td>${product.category}</td>
                <td>${product.price}</td>
                <td><img src="images/${product.productImage}" height="100" alt="Product Image"></td>
                <td><a href="editProduct?id=${product.id}">Edit<i class='fas fa-pen-fancy'></i></a></td>
                <td><a href="deleteProduct?id=${product.id}">Delete<i class='fas fa-pen-fancy'></i></a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
