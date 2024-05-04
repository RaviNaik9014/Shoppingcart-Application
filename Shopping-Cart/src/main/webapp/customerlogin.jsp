<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
<style>
  body {
  	min-height: 100%;
	 background-image: url(https://images.pexels.com/photos/1037995/pexels-photo-1037995.jpeg?cs=srgb&dl=pexels-moose-photos-170195-1037995.jpg&fm=jpg);
    background-repeat: no-repeat;
    background-size: cover ;
    
  }
  .container {
    max-width: 400px;
    margin:auto 50px;
    margin-top: 100px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
    text-align: center;
    border-radius: 40px 0px 40px 40px ;
  }
  h1, h2 {
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
  input[type="email"],
  input[type="password"] {
    width: 300px;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ced4da;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color 0.3s;
  }
  input[type="email"]:focus,
  input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
  }
  input[type="submit"] {
    width: 100%;
    background-color: #007bff;
    color: #ffffff;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  input[type="submit"]:hover {
  font-size: 15px;
    background-color: #0056b3;
    box-shadow: 0px 0px 10px white ;
		cursoe: pointer;
  }
</style>
</head>
<body>
  <div class="container">
    <h1>${msg}</h1>
    <h2 style ="color: black">Please Login</h2>
    <form action="customerloginvalidate" method="post">
      <label for="email">Enter Email:</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Enter Password:</label>
      <input type="password" id="password" name="password" required>

      <input type="submit" value="Login">
    </form>
  </div>
</body>
</html>