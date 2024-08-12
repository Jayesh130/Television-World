<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<style>
	.container {
    margin: 0 auto;
    max-width: 600px;
    padding: 20px;
}

h1 {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"],
textarea {
	width: 50%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="checkbox"] {
	margin-right: 10px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
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
<body>
<div class="header">
		<h2><a class="back" href="showAllProducts"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
	</div>
	<div class= "container">
<h1>Edit Product</h1>
<form action="editProduct" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${product.id}"/>
    <p>Name: </br><input type="text" name="productName" value="${product.productName}"/></p>
    <p>Category: </br><input type="text" name="category" value="${product.category}"/></p>
    <p>Price: </br><input type="text" name="price" value="${product.price}"/></p>
    <p>Image: </br><input type="file" name="productImage" value="${product.productImage}"/></p>
    <p><input type="submit" value="Update Product"/></p>
</form>
</div>
</body>
</html>
