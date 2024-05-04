<%@page import="com.shoppingcart_application.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Another Products</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
	body {
    min-height: 100%;
  	background-image: url(https://t4.ftcdn.net/jpg/02/86/36/11/360_F_286361199_fzZsOpZ3memFzCn889a9TZHMuTTsFrVl.jpg);
  	background-repeat: no-repeat;
  	background-size: cover ;
  	background-position: center;
  	
  	margin : 0;
  }
  .view-cart-btn {
    background-color: #f00;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 18px;
    margin-top: 10px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  .view-cart-btn:hover {
    background-color: #c00; /* Change color on hover */
  }
</style>
</head>
<body>
  <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
  <a class="navbar-brand" href="#">Product Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="customeroptions.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
    </ul>
  </div>
</nav>
  
  <!-- Table to display the list of another products -->
  <table class="table">
   	<thead class="thead-light">
      <tr>
        <th>Name</th>
        <th>Brand</th>
        <th>Category</th>
        <th>Price</th>
        <th>Add Cart</th>
      </tr>
    </thead>
    <tbody>
    
      <% 
      List<Product> Products = (List<Product>) request.getAttribute("customerlistproducts");
      for (Product ap : Products) {
      %>
       <tr>
    <td><%= ap.getName() %></td>
    <td><%= ap.getBrand() %></td>
    <td><%= ap.getCategory() %></td>
    <td><%= ap.getPrice() %></td>
    <td><a href="additem?id=<%= ap.getId() %>">+ Add</a></td>
</tr>
      <% 
      }
      %>
    </tbody>
  </table>
  <button class="view-cart-btn"><a href="fetchitemsfromcart" style="color: white; text-decoration: none;">View Cart</a></button>
</body>
</html>