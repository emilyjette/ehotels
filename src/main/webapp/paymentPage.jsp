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
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Insert Payment for renting</h2>
<form action="">
    <label for="rID">Renting ID:</label>
    <input type="number" id="rID" name="rID"><br><br>
    <label for="amount">Payment Amount:</label>
    <input type="number" id="amount" name="amount"><br><br>
    Payment method: <label for="method"></label><select name="method" id="method">
    <option value="1">Debit</option>
    <option value="2">Credit</option>
    </select><br><br>
    <input type="submit" value="Submit">

</form>
</body>
</html>
