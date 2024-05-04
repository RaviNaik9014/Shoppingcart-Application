<%@page import="com.shoppingcart_application.dto.Items"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>
<style>
  body { 	
    min-height: 100vh;
  	background-image: url(https://img.freepik.com/premium-photo/travel-around-world-your-colorful-life-enjoy-funny-trip-journey-top-view-copy-space-some-idea-your-create-destination-object-cute-car-plane-vintage-color-background_717482-612.jpg);
  	background-repeat: no-repeat;
  	background-size: cover ;
  	background-position: center;
  	
  	margin : 0;
  }
  .navbar {
    background-color: #333;
    overflow: hidden;
  }
  .navbar a {
    float: left;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
  }
  .navbar a:hover {
    background-color: #ddd;
    color: black;
  }
  .content {
    padding: 20px;
  }
  h2 {
    color: #008000;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }
  th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
  }
  th {
    background-color: lightblue;
  }
  tr:nth-child(even) {
    background-color: #f9f9f9;
  }
  button {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-decoration: none;
    margin-top: 20px;
  }
  button a {
    text-decoration: none;
    color: white;
  }
  button:hover {
    background-color: #45a049;
  }
</style>
</head>
<body>

<div class="navbar">
  <a href="customeroptions.jsp">Home</a>
  <a href="#">About</a>
  <a href="#">Contact</a>
</div>

<div class="content">
  <%
    List<Items> items = (List<Items>)request.getAttribute("itemslist") ;
    double totalprice = (Double) request.getAttribute("totalprice") ;
  %>
  <h2>Cart Details:</h2>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Brand</th>
        <th>Category</th>
        <th>Quantity</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody>
      <%
        for(Items i : items) {
      %>
        <tr>
          <td><%= i.getName()%></td>
          <td><%= i.getBrand() %></td>
          <td><%= i.getCategory() %></td>
          <td><%= i.getQuantity() %></td>
          <td><%= i.getPrice() %></td>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>
  <h2>Total Price: <%= totalprice %></h2>
  <button><a href="addorder">Place Order</a></button>
  <h3>View Product</h3>
  <button><a href="fetchallproducts">View</a></button>
</div>

</body>
</html>