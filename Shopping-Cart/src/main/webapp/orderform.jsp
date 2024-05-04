<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address the order</title>
<style>
  body {
  	min-height: 100%;
   background-image: url(https://st4.depositphotos.com/12985790/25316/i/450/depositphotos_253164172-stock-photo-cropped-view-young-woman-holding.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    padding : 50px;
      }
  h2 {	
    color: #008000;
  }
  form {
    max-width: 400px;
    background-color: ;
    margin: 20px;
    margin-left:700px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 40px 0px 40px 40px ;
  }
  label {
    display: block;
    margin-bottom: 8px;
    color: #555;
    font-weight: bold;
  }
  input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  input[type="submit"]:hover {
    font-size: 15px;
    background-color: #45a049;
    box-shadow: 0px 0px 10px white ;
    cursor: pointer;
  }
</style>
</head>
<body>
<form action="saveorder" modelAttribute="orderobj" method="post" >
<h2>Order Address:</h2>
  <label for="name">Enter Name:</label>
  <input type="text" id="name" name="name" required>

  <label for="mobilenumber">Enter Mobile Number:</label>
  <input type="text" id="mobilenumber" name="moblienumber" required>

  <label for="address">Enter Address:</label>
  <input type="text" id="address" name="address" required>

  <input type="submit" value="Submit">
</form>
</body>
</html>
