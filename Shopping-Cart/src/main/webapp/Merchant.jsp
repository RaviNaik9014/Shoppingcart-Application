<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Merchant Home</title>
<style>
  body {
  	height: 100vh;
	background-image: url(https://img.freepik.com/free-photo/shopping-bag-cart_23-2148879372.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    
    margin : 0;
  }

  .navbar {
    background-color: #333;
    color: white;
    padding: 10px 0;
    text-align: center;
  }

  .navbar a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    margin: 0 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .navbar a:hover {
    background-color: #555;
  }

  .container {
    max-width: 1000px;
    margin: 50px auto;
   background-color:lightb;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, c0.1);
    text-align: center;
  }

  .heading {
    color: #333;
    margin-bottom: 20px;
  }

  .button-container {
    margin-top: 30px;
  }

  .button-container button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 10px;
    transition: background-color 0.3s ease;
  }

  .button-container button:hover {
    background-color: #45a049;
  }
</style>
</head>
<body>

<div class="navbar">
  <a href="#">Home</a>
  <a href="#">About</a>
  <a href="#">Contact</a>
</div>

<div class="container">
  <h2 class="heading">Welcome to Our Online Store</h2>

  <p>Discover a wide range of products tailored to your needs. Sign up now to enjoy exclusive offers!</p>

  <div class="button-container">
    <button><a href="addmerchant" style="color: white; text-decoration: none;">Register</a></button>
    <button><a href="merchantlogin.jsp" style="color: white; text-decoration: none;">Login</a></button>
  </div>
</div>

</body>
</html>