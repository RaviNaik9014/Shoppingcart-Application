<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Options</title>
<style>
  body {
    min-height: 100vh;
  	background-image: url(https://img.freepik.com/premium-photo/front-view-paper-clip-with-copy-space_23-2148539079.jpg);
  	background-repeat: no-repeat;
  	background-size: cover ;
  	background-position: center;
  	
  	margin : 0;
  }
  .navbar {
    background-color: #333;
    color: white;
    padding: 10px;
    text-align: center;
  }
  .navbar a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
  }
  .container {
    max-width: 800px;
    margin: 50px auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }
  .box {
    width: 45%;
    margin-top: 50px;
    margin-bottom: 20px;
    background-color: lightblue;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
  }
  .box:hover {
    transform: translateY(-5px);
  }
  .box h3 {
    padding: 20px;
    margin: 0;
    color: #333;
    font-size: 18px;
    text-align: center;
  }
  .box a {
    text-decoration: none;
    color: #007bff;
    transition: color 0.3s;
  }
  .box a:hover {
    color: #0056b3;
  }
</style>
</head>
<body>
  <div class="navbar">
    <a href="Customer.jsp">Home</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
  </div>
  <div class="container">
    <div class="box">
      <h3><a href="fetchallproducts">Products</a></h3>
    </div>
    <div class="box">
      <h3><a href="viewproductsbybrand?brand=brand">Brand</a></h3>
    </div>
    <div class="box">
      <h3><a href="viewproductsbycategory?category=category">Category</a></h3>
    </div>
    <div class="box">
      <h3><a href="viewproductspricerange?minPrice=10&maxPrice=100000">Price</a></h3>
    </div>
  </div>
</body>
</html>