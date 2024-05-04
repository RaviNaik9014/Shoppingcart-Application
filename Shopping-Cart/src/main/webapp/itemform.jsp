<%@page import="com.shoppingcart_application.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
<style>
  body {
  min-height: 100%;
   background-image: url(https://static.vecteezy.com/system/resources/previews/006/663/095/non_2x/shopping-concept-cartons-or-paper-boxes-and-shopping-bag-in-red-shopping-cart-on-pink-background-online-shopping-consumers-can-shop-from-home-and-delivery-service-with-copy-space-free-photo.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 20px;
  }
  h3 {
    color: #008000;
  }
  form {
    max-width: 400px;
    margin: auto 50px;
    background-color: lightpink;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  form input[type="text"],
  form input[type="number"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  form input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  form input[type="submit"]:hover {
    font-size: 15px;
    background-color: lightblue; /* Changed "lightwhite" to "#ffffff" */
    box-shadow: 0px 0px 10px white;
    cursor: pointer;
  }
</style>
</head>
<body>
    <%
    Product p = (Product) request.getAttribute("prodobj");
    %>
    
    <form action="additemtocart">
    	<h3>Add to Cart</h3>
        <input type="hidden" name="id" value="<%= p.getId() %>" readonly="true">       <br>
        Name : <input type="text" name="name" value="<%= p.getName() %>" readonly="true"> <br>
        Brand : <input type="text" name="brand" value="<%= p.getBrand() %>" readonly="true">   <br>
        Category : <input type="text" name="category" value="<%= p.getCategory() %>" readonly="true">  <br>
        Price : <input type="number" name="price" value="<%= p.getPrice() %>" readonly="true">     <br>
     Quantity : <input type="number" name="quantity">   <br>
    <input type="submit" value="Add">
    </form>
</body>
</html>