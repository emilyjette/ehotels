<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> E-Hotels Main Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
<jsp:include page="navbar.jsp"/>

<h2>Are you a customer or an employee?</h2>
<button onClick = "goToCustomerPage()">Customer</button>
<button onClick = "goToEmployeePage()">Employee</button>

<script>
function goToCustomerPage(){
window.location.href = 'customerPage.jsp';
}
</script>

<script>
function goToEmployeePage(){
window.location.href = 'employeePage.jsp';
}
</script>

</body>
</html>
