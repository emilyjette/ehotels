<%@ page import="com.RoomService" %>
<%@ page import="com.Room" %>
<%@ page import="com.CustomerService" %>
<%@ page import="java.sql.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String roomId = request.getParameter("roomId");
    String date_start = request.getParameter("date_start");
    String chain_name = request.getParameter("chain_name");
    String area = request.getParameter("area");

    Integer intRoomId = Integer.parseInt(roomId);
    Date sqlDateStart = Date.valueOf(date_start);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Booking Creation Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Book Room</h2>

<%--date start- automatically roomID- should be added automatically--%>
<h4>You are booking a room:</h4>
Starting on:  <%= date_start %>
<br>
At <%= chain_name %> in <%= area %>
<br><br>
<form action="BookRoomServlet" method="post">
Enter your name: <input type="text" name="custName" id = "custName" placeholder ="John Doe">
    <input type="hidden" name="roomId" value="<%= roomId %>">
    <input type="hidden" name="date_start" value="<%= date_start %>">
    <br><br>
    <button type="submit">Create a booking</button>
</form>
</body>

</html>