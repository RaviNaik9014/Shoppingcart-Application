<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_application.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Products by Price</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100%;
            background-image: url(https://t4.ftcdn.net/jpg/02/21/34/65/360_F_221346515_TlYlnx6Aw52ifNfY2DRxLmlL5uVaMBqg.jpg);
            background-repeat: no-repeat;
            background-size: cover ;
            background-position: center;
            margin: 0;
        }
        .view-cart-btn {
            background-color: #f00;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            margin-top: 10px;
            margin-left: 80px;
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
  
   <!-- Form to search products by price -->
<div class="container mt-4">
    <form action="viewproductspricerange" method="GET">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="minPrice">Minimum Price:</label>
                <input type="number" class="form-control" id="minPrice" name="minPrice" placeholder="Enter min price" required>
            </div>
            <div class="form-group col-md-6">
                <label for="maxPrice">Maximum Price:</label>
                <input type="number" class="form-control" id="maxPrice" name="maxPrice" placeholder="Enter max price" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>
    
    <!-- Table to display the list of products -->
    <div class="container mt-4">
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Product> products = (List<Product>) request.getAttribute("pricelist");
                if (products != null) {
                    for (Product product : products) {
                %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getBrand() %></td>
                    <td><%= product.getCategory() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><a href="additem?id=<%= product.getId() %>">+ Add</a></td>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">No products found within this price range.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
  
    <button class="view-cart-btn"><a href="fetchitemsfromcart" style="color: white; text-decoration: none;">View Cart</a></button>
</body>
</body>
</html>