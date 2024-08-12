<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style type="text/css">

.container {
	margin: 0 auto;
	max-width: 600px;
	padding: 20px;
}

h2 {
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
	width: 100%;
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
</head>
<body>
<div class="header">
		<h2><a class="back" href="adminDash.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>
	</div>
	<div class="container">
		<h2>Add New Product</h2>
		
			<form action="addNewProduct" method="post" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="name">Product Name:</label>
				<input type="text" name="name" id="name" required="required">
			</div>
			<div class="form-group">
				<label for="product_category">Product Category:</label>
				<input type="text" name="category" id="category"  required="required">
			</div>
			<div class="form-group">
				<label for="price">Product Price:</label>
				<input type="number" name="price" id="price"  required="required">
			</div>
			<div class="form-group">
				<label for="image">Product Image:</label>
				<input type="file" name="image" id="image"  required="required">
			</div>
			
			
			<div class="form-group">
				<input type="submit" value="Add Product">
			</div>
		</form>
	</div>

</body>
</html>