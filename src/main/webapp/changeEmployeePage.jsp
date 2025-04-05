<%@ page import="com.EmployeeService" %>
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
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Add/Delete/Update Employee Info</h2>
<h3>You are creating an employee:</h3>
<br><br>
<form action="CreateEmployeeServlet" method="post">
Enter Employee SSN:  <input type="text" name="SSN" id = "SSN" placeholder ="0">
<br>
Enter Employee First Name: <input type="text" name="first_name" id = "first_name" placeholder ="">
<br>
Enter Employee Last Name: <input type="text" name="last_name" id = "last_name" placeholder ="">
<br>
Enter Employee Address: <input type="text" name="address" id = "address" placeholder ="">
<br>
<br>
    <button type="submit">Create an Employee</button>
</form>
<h4>You are deleting an employee:</h4>
<br><br>
<form action="DeleteEmployeeServlet" method="post">
Enter Employee SSN:  <input type="text" name="SSN" id = "SSN" placeholder ="0">
<br>
    <button type="submit">Delete an Employee</button>
</form>

<form action="UpdateEmployeeServlet" method="post">
<h5>You are updating an employee:</h5>
<br><br>
Enter Employee SSN:  <input type="text" name="SSN" id = "SSN" placeholder ="0">
<br>
Enter Employee First Name: <input type="text" name="first_name" id = "first_name" placeholder ="">
<br>
Enter Employee Last Name: <input type="text" name="last_name" id = "last_name" placeholder ="">
<br>
Enter Employee Address: <input type="text" name="address" id = "address" placeholder ="">
<br>
<br>
    <button type="submit">Update an Employee</button>
</form>
</body>