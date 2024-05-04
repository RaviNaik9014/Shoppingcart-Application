<%@page import="com.shoppingcart_application.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_application.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Products</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  /* Additional custom styles */
  body
  {
  background-image: url(https://img.freepik.com/premium-photo/consumer-concept-mini-shopping-trolley-shopping-colored-background-minimalism-top-view_661495-6692.jpg);
  background-repeat: no-repeat;
  background-size: cover;
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
        <a class="nav-link" href="merchantoptions.jsp">Home <span class="sr-only">(current)</span></a>
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

<div class="container mt-4">
  <h2 style="color: green;">Product List :</h2>
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Brand</th>
        <th>Category</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Update</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <% 
      List<Product> products = (List<Product>) request.getAttribute("productlist");
      for (Product p : products) {
      %>
        <tr>
          <td><%= p.getId() %></td>
          <td><%= p.getName() %></td>
          <td><%= p.getBrand() %></td>
          <td><%= p.getCategory() %></td>
          <td><%= p.getPrice() %></td>
          <td><%= p.getStock() %></td>
          <td><a href="updateproduct?id=<%= p.getId() %>">Update</a></td>
          <td><a href="deleteproduct?id=<%= p.getId() %>">Delete</a></td>
        </tr>
      <% 
      }
      %>
    </tbody>
  </table>

  <h3 style="color: green;"> Add Product</h3>
  <button class="btn btn-primary"><a href="addproduct" style="color: white; text-decoration: none;">+ Add</a></button>
</div>

</body>
</html>