<%@ page import="com.shoppingcart_application.dto.Orders" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored ="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Bill</title>
    <style>
        body {
            min-height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url(https://t4.ftcdn.net/jpg/05/39/99/67/360_F_539996737_T5gJEIEqsGUjMXhrLZt0lDLcrOWsSHlb.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 20px;
        }
        #bill-container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            margin-left: 500px;
            padding: 20px;
            border-radius: 10px;
        }
        h2 {
            color: #008000;
            border-bottom: 2px solid #008000;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            margin-top: 20px;
        }
        button a {
            text-decoration: none;
            color: white;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="bill-container">
        <h2>Customer Bill</h2>
        <% Orders order = (Orders) request.getAttribute("orderdetails"); %>
        <% double totalprice = (Double) request.getAttribute("totalprice"); %>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Mobile Number</th>
                    <th>Address</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= order.getName() %></td>
                    <td><%= order.getMoblienumber() %></td>
                    <td><%= order.getAddress() %></td>
                    <td><%= totalprice %></td>
                </tr>
            </tbody>
        </table>
        <h2 sytle="color:black">Thank you for Order...!! Come Again..!! </h2>
        <h3>View Products</h3>
        <button><a href="fetchallproducts">View</a></button>
    </div>
</body>
</html>
