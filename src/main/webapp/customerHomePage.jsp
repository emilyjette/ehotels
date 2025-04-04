<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Customer Home Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Hello Customer!</h2>
<h4>What would you like to do?</h4>
<button onClick = "goToCustomerCreationPage()">Create an account</button>
<br><br>
<button onClick = "goToCustomerSearchPage()">Search for / Book a Room</button>

<script>
function goToCustomerSearchPage(){
window.location.href = 'customerSearchPage.jsp';
}
function goToCustomerCreationPage(){
window.location.href='customerCreationPage.jsp';
}
</script>
</body>
</html>