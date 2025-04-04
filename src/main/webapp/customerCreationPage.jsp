<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Customer Creation Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Create Account</h2>
<form action="CreateCustomerServlet" method="post">
    Enter your name: <input type="text" name="custName" id = "custName" placeholder ="John Doe">
    <br><br>
    Enter your address: <input type="text" name="address" id = "address" placeholder ="123 Play Street">
    <br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>