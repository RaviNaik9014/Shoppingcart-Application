<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
<style>
  body {
  	min-height: 100%;
  	background-image: url(https://www.retailconsumerproductslaw.com/wp-content/uploads/sites/22/2023/12/Online-shopping-concept-GettyImages-1301022916-Med.jpg);
  	background-repeat: no-repeat;
  	background-size: cover ;
  	background-position: center;

  }

  .container {
    max-width: 500px;
    margin-left: 650px;
    background-color: ;
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
  <h2>Add Product</h2>
  <form action="saveproduct" method="post">
    <label for="name">Product Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="brand">Product Brand:</label>
    <input type="text" id="brand" name="brand" required>

    <label for="category">Product Category:</label>
    <input type="text" id="category" name="category" required>

    <label for="price">Product Price:</label>
    <input type="number" id="price" name="price" min="0" step="0.01" required>

    <label for="stock">Product Stock:</label>
    <input type="number" id="stock" name="stock" min="0" required>

    <input type="submit" value="Add Product">
  </form>
</div>

</body>
</html>