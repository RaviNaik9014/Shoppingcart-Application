<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register As Merchant </title>
<style>
	body
	{
	background-image : url(https://img.freepik.com/premium-photo/hand-pushing-shopping-cart-trolley-blue-background_33874-314.jpg);
  	background-repeat: no-repeat;
  	background-size: cover ;
	}
	#from
	{
		background:linear-gradient(45deg, lightgreen );
		width : 300px ;
		text-align :center;
		margin: 50px auto;
		padding : 20px ;
		border: 2x solid black ;
		box-shadow: 0px 0px 10px ghostwhite;
		border-radius: 0px 40px 0px 40px ;
	}
	.first-list>input[type="text"],
	.first-list>input[type="email"],
	.first-list>input[type="password"],
	.first-list>textarea,
	.first-list>select
	{
		color: black;
		border: none;
		outline:none;
		background-color: transparent;
		padding : 10px;
		border-bottom: 2px solid ghostwhite;
	}
	.first-list>input[type="Submit"]
	{
		background:lightblue;
		width:200px;
		padding: 10px;
		border:2px solid ghostwhite;
		border-radius: 25px;
	}
	.first-list>input[type="Submit"]:hover
	{
		box-shadow: 0px 0px 10px white ;
		cursoe: pointer;
	}
	.first-list
	{
		border:none;
		padding : 10px;
	}
	#icon>span
	{
	background-color: darkcyan;
	color: black;
	border: 5px solid white;
	margin-top:-200px ;
	font-size: 60px;
	border-radius: 100%;
	box-shadow: 0px 0px 10px ghostwhite;	
	}
	::placeholder
	{
	color: black;
	font-size: 15px;
	}
</style>
</head>
<body>
	<form action ="savemerchant" modelAttribute="merchantobj" id ="from">
		<div id ="icon">
			<span>Merchant</span>
		</div>
		<div class ="first-list">
		<input type ="text" placeholder="Enter Name" name="name" required>
		</div>
		<div class ="first-list">
		<input type ="text" placeholder="Enter Mobile Number" name="mobilenumber" required>
		</div>
		<div class ="first-list">
		<input type ="email" placeholder="Enter Email" name="email" required>
		</div>
		<div class ="first-list">
		<input type ="password" placeholder="Enter Password" name="password" required>
		</div>
		<div class ="first-list">
		<input type ="password" placeholder="Confirm Password" name="confirmPassword" required>
		</div>
		<div class ="first-list">
		<input type ="submit" value ="Register Here">
		</div>
	</form>
</body>
</html>