<%@ page import="com.HotelService" %>
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
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Add/Delete/Update Hotel Info</h2>
<h3>You are creating a hotel:</h3>
<br><br>
<form action="CreateHotelServlet" method="post">
Enter Hotel ID:  <input type="text" name="ID" id = "ID" placeholder ="0">
<br>
Enter Hotel Chain Name: <input type="text" name="chain_name" id = "chain_name" placeholder ="">
<br>
Enter Hotel Chain Address: <input type="text" name="chain_address" id = "chain_address" placeholder ="">
<br>
Enter Hotel Number of Rooms: <input type="text" name="num_of_rooms" id = "num_of_rooms" placeholder ="">
<br>
Enter Hotel Email: <input type="text" name="email" id = "email" placeholder ="">
<br>
Enter Hotel Address: <input type="text" name="address" id = "address" placeholder ="">
<br>
Enter Hotel Area: <input type="text" name="area" id = "area" placeholder ="">
<br>
Enter Hotel Phone: <input type="text" name="phone" id = "phone" placeholder ="">
<br>
Enter Hotel Rating: <input type="text" name="rating" id = "rating" placeholder ="">
<br>
<br>
    <button type="submit">Create a Hotel</button>
</form>
<h4>You are deleting a hotel:</h4>
<br><br>
<form action="DeleteHotelServlet" method="post">
Enter Hotel ID:  <input type="text" name="ID" id = "ID" placeholder ="0">
<br>
    <button type="submit">Delete a Hotel</button>
</form>

<form action="UpdateHotelServlet" method="post">
<h5>You are updating a hotel:</h5>
<br><br>
Enter Hotel ID:  <input type="text" name="ID" id = "ID" placeholder ="0">
<br>
Enter Hotel Chain Name: <input type="text" name="chain_name" id = "chain_name" placeholder ="">
<br>
Enter Hotel Chain Address: <input type="text" name="chain_address" id = "chain_address" placeholder ="">
<br>
Enter Hotel Number of Rooms: <input type="text" name="num_of_rooms" id = "num_of_rooms" placeholder ="">
<br>
Enter Hotel Email: <input type="text" name="email" id = "email" placeholder ="">
<br>
Enter Hotel Address: <input type="text" name="address" id = "address" placeholder ="">
<br>
Enter Hotel Area: <input type="text" name="area" id = "area" placeholder ="">
<br>
Enter Hotel Phone: <input type="text" name="phone" id = "phone" placeholder ="">
<br>
Enter Hotel Rating: <input type="text" name="rating" id = "rating" placeholder ="">
<br>
<br>
    <button type="submit">Update a Hotel</button>
</form>
</body>