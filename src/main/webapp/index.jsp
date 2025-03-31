<!DOCTYPE html>
<html>
<body>
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
