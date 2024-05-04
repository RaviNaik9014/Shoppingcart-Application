<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Product</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: darkcyan;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  h2 {
    color: #333;
  }

  form {
    margin-top: 20px;
  }

  label {
    display: block;
    margin-bottom: 5px;
    color: #333;
  }

  input[type="text"],
  input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #45a049;
    cursor:pointer;
  }
</style>
</head>
<body>

<div class="container">
  <h2>Update Product</h2>
  <form:form action="viewupdatelist" modelAttribute="updateproductlist" method="post">
    <input type="hidden" id="id" name="id" value="${updateproductlist.id}">
    
    <label for="name">Product Name:</label>
    <form:input type="text" path="name" id="name" required="true" value="${product.name}" />

    <label for="brand">Product Brand:</label>
    <form:input type="text" path="brand" id="brand" required="true" value="${product.brand}" />

    <label for="category">Product Category:</label>
    <form:input type="text" path="category" id="category" required="true" value="${product.category}" />

    <label for="price">Product Price:</label>
    <form:input type="number" path="price" id="price" min="0" step="0.01" required="true" value="${product.price}" />

    <label for="stock">Product Stock:</label>
    <form:input type="number" path="stock" id="stock" min="0" required="true" value="${product.stock}" />

    <input type="submit" value="Update Product">
  </form:form>
</div>

</body>
</html>