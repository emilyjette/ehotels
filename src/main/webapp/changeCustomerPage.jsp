

<%@ page import="com.CustomerService" %>
<%@ page import="java.sql.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Employee Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Add/Delete/Update Customer Info</h2>
<h3>You are creating a customer:</h3>
<br><br>
<form action="CreateCustomerServlet" method="post">
Enter Customer ID:  <input type="text" name="custID" id = "custID" placeholder ="0">
<br>
Enter Customer Name: <input type="text" name="custName" id = "custName" placeholder ="">
<br>
Enter Customer Address: <input type="text" name="custAddress" id = "custAddress" placeholder ="">
<br>
Enter Date Registered: <input type="text" name="date_of_reg" id = "date_of_reg" placeholder ="">
<br>
<br>
    <button type="submit">Create a Customer</button>
</form>
<h4>You are deleting a customer:</h4>
<br><br>
<form action="DeleteCustomerServlet" method="post">
Enter Customer ID:  <input type="text" name="custID" id = "custID" placeholder ="0">
<br>
    <button type="submit">Delete a Customer</button>
</form>

<form action="UpdateCustomerServlet" method="post">
<h5>You are updating a customer:</h5>
<br><br>
Enter Customer ID:  <input type="text" name="custID" id = "custID" placeholder ="0">
<br>
Enter Customer Name: <input type="text" name="custName" id = "custName" placeholder ="">
<br>
Enter Customer Address: <input type="text" name="custAddress" id = "custAddress" placeholder ="">
<br>
Enter Date Registered: <input type="text" name="date_of_reg" id = "date_of_reg" placeholder ="">
<br>
<br>
    <button type="submit">Update a Customer</button>
</form>
</body>
