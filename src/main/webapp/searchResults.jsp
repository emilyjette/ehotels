<%@ page import="com.RoomService" %>
<%@ page import="com.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String capacity = request.getParameter("capacity");
String area= request.getParameter("area");
String chain_name= request.getParameter("chain_name");
String rating = request.getParameter("rating") ;
String num_of_rooms = request.getParameter("num_of_rooms");
String price= request.getParameter("price") ;
String date_start = request.getParameter("date_start") ;
String date_end= request.getParameter("date_end") ;

    // retrieve rooms from database
    RoomService test = new RoomService();
    List<Room> rooms = null;
    try {
        rooms = test.getSpecificRooms(Integer.parseInt(capacity),area, chain_name, Double.parseDouble(rating),Integer.parseInt(num_of_rooms), Float.parseFloat(price));
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Search Results Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <style>
    th, td {
      border: 1px solid black;
      padding: 50px;
      text-align:center;
    }
    </style>
</head>

<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Search Results</h2>
<h4>Criteria:</h4>
  Capacity: <%= capacity %><br>
  Area: <%= area %><br>
  Chain Name: <%= chain_name %><br>
  Rating: <%= rating %><br>
  Number of rooms: <%= num_of_rooms%><br>
  Price: <%= price %><br>
  Start of stay: <%= date_start %><br>
  End of stay:  <%= date_end %><br><br>
  <h4>Results:</h4>
<% if (rooms == null || rooms.size() == 0 ) { %>
                      <h2 style="margin-top: 5rem;">No Rooms found!</h2>
                        <% } else { %>
<table>
  <tr>
    <th>Price</th>
    <th>Amenities</th>
    <th>Capacity</th>
    <th>View</th>
    <th>Damages</th>
    <th>Extendable</th>
  </tr>
  <%
    for (Room r : rooms) { %>
    <tr>
    <td><%= r.getPrice() %></td>
    <td><%= r.getAmenities() %></td>
    <td><%= r.getCapacity() %></td>
    <td><%= r.getView() %></td>
    <td><%= r.getDamages() %></td>
    <td><%= r.getExtendable() %></td>
    </tr>
   <% } %>
</table>
 <% } %>

</body>
</html>