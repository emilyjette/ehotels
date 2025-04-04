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
<jsp:include page="navbar.jsp"/>
<h2>Hello Employee!</h2>
<h2>Select service</h2>
<button onClick = "goToConvertPage()">Turn Booking into renting</button><br>
<button onClick = "goToRentingPage()">Create renting</button><br>
<button onClick = "goToPaymentPage()">Insert Customer Payment</button>


<script>
    function goToConvertPage(){
        window.location.href = 'bookingToRentingPage.jsp';
    }
</script>

<script>
    function goToRentingPage(){
        window.location.href = 'createRentingPage.jsp';
    }
</script>

<script>
    function goToPaymentPage(){
        window.location.href = 'paymentPage.jsp';
    }
</script>
</body>
</html>