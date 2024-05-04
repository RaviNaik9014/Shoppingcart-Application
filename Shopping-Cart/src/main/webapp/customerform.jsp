<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Register</title>
<style>
  body {
    background-image: url(https://img.freepik.com/premium-photo/consumer-concept-mini-shopping-trolley-shopping-colored-background-minimalism-top-view_661495-6692.jpg);
    background-repeat: no-repeat;
    background-size: cover ;
    
  }
  .container {
    max-width: 400px;
    margin: auto 50px ;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
    text-align: center;
    border-radius: 0px 40px 0px 40px ;
  }
  h3 {
    color: green;
    margin-bottom: 20px;
  }
  form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  label {
    margin-bottom: 8px;
    color: #555555;
    font-weight: bold;
  }
  input[type="text"],
  input[type="password"] {
    width: 300px;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ced4da;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color 0.3s;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
  }
  input[type="submit"] {
    width: 100%;
    background-color: green;
    color: #ffffff;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  input[type="submit"]:hover {
  	font-size: 15px;
    background-color: lightwhite;
    box-shadow: 0px 0px 10px white ;
		cursoe: pointer;
  }
</style>
</head>
<body>
  <div class="container">
    <h3>PLEASE REGISTER</h3>
    <form action="savecustomer" method="post">
      <label for="name">Customer Name:</label>
      <input type="text" id="name" name="name" required>

      <label for="mobilenumber">Mobile Number:</label>
      <input type="text" id="mobilenumber" name="mobilenumber" required>

      <label for="email">Email:</label>
      <input type="text" id="email" name="email" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
      
      <label for="confirmpassword">Confirm Password:</label>
      <input type="password" id="confirmpassword" name="confirmpassword" required>

      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>