<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored ="false"%>
<!DOCTYPE html>
<html >
<head>
  <title>Merchant Login</title>
  <link rel="stylesheet" href="../fontawesome/fb/css/all.min.css">
  <style>

body {
	min-height:100%;
    background-image: url(https://img.freepik.com/free-photo/colorful-shopping-bags_23-2147652050.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
#from
{
	width: 300px;
	text-align: center;
	margin: 120px auto;
	padding: 20px;
	border: 2px solid ghostwhite;
	box-shadow: 0px 0px 10px ghostwhite;
	border-radius: 40px 0px 40px 0px;

}
.from_list>input[type="email"],
.from_list>input[type="password"],
.from_list>textarea,
.from_list>select
{
	color: black;
	border: none;
	outline: none;
	background-color: transparent;
/*	color: black;*/
	padding: 10px;
	border-bottom: 2px solid ;
}
.from_list
{
	broder:none;
	padding: 10px;
}
.from_list>input[type="Submit"]
{
	background:lightblue;
	width: 200px;
	padding: 10px;
	border: 2px solid ghostwhite;
	border-radius: 25px;

}
.from_list>input[type="Submit"]:hover
{
	box-shadow: 0px 0px 10px white;
	cursor: pointer;

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
	<form action="merchantloginvalidate" id ="from">
    <div id="icon">
			<span class="">Merchant</span>
		</div>
	<div>
		<h2 style ="color:black">${msg}</h2>
	</div>
    <div class ="from_list">
      <input type ="email" placeholder="Enter Email" name="email" required>
    </div>
    <div class="from_list">
      <input type ="password" placeholder="Enter Password" name="password" required>
    </div>
    <div class="from_list">
			<input type="Submit" value="Login Here">
		</div>
  </form>
</body>
</html>