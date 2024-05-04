<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@page import="com.shoppingcart_application.dto.Merchant"%>
<html>
<head>
<meta charset="UTF-8">
<title>Product Menu</title>
<style>
	*
	{
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}

	body {
		background-image: url(https://t4.ftcdn.net/jpg/04/29/97/39/360_F_429973962_6vMeg6RYgfFvKvBy6A2r8WlpOvFX9746.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		font-family: Arial, sans-serif;
	}

	.navbar {
		background-color: #333;
		color: white;
		padding: 10px 20px;
		text-align: center;
	}

	.navbar h2 {
		margin: 0;
	}

	.navbar a {
		color: white;
		text-decoration: none;
		margin: 0 10px;
	}

	.container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100%;
	}

	.card {
		width: 300px;
		background-color: #f9f9f9;
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 20px;
		margin: 20px;
		margin-top: 100px;
		box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	}

	.card h2 {
		margin-bottom: 10px;
	}

	.card a {
		display: block;
		background-color: #333;
		color: white;
		text-decoration: none;
		padding: 10px 20px;
		border-radius: 5px;
		margin-top: 20px;
	}

	.card a:hover {
		background-color: #555;
	}
</style>
</head>
<body>
	<div class="navbar">
		<h2>Merchant</h2>
		<a href="Merchant.jsp">Home</a>
		<a href="#">About</a>
		<a href="#">Contact</a>
	</div>

	<div class="container">
		<% 
		Merchant m = (Merchant) session.getAttribute("merchantinfo");
		if (m != null) { 
		%>

		<div class="card">
			<h2>View All Products</h2>
			<a href="viewallproducts">View Products</a>
		</div>
		<div class="card">
			<h2>Add Product</h2>
			<a href="addproduct">Add Product</a>
		</div>
		<% } else { %>
		<div class="card">
			<h2>Login First</h2>
			<a href="merchantlogin.jsp">Login</a>
		</div>
		<% } %>
	</div>
</body>
</html>
