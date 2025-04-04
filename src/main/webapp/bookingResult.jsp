<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Result</title>
</head>
<body>
    <h2>Booking Result</h2>

    <!-- Displaying the result message passed from the servlet -->
    <p>
            <strong>Result:</strong> <%= request.getAttribute("message") %>

    </p>

    <!-- Optionally, you can add a button or link to go back to the booking form -->
    <a href="customerSearchPage.jsp"><button>Back to Room Search</button></a>
</body>
</html>
