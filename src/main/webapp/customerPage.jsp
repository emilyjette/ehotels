<%@ page import="com.RoomService" %>
<%@ page import="com.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // retrieve rooms from database
    RoomService test = new RoomService();
    List<Room> rooms = null;
    try {
        rooms = test.getAllRooms();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Customer Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Hello Customer!</h2>

<form name="form1" id="form1" action="/action_page.php">
  Capacity: <select name="capacity" id="capacity">
    <option value="1" selected="selected">1 person</option>
    <option value="2">2 people</option>
    <option value="3">3 people</option>
    <option value="4">4 people</option>
  </select>
  <br><br>
  Area: <select name="area" id="area">
    <option value="1" selected="selected"> Transylvania</option>
    <option value="2">Australia</option>
    <option value="3">Austria</option>
    <option value="4">Barbados</option>
    <option value="5">Botswana</option>
    <option value="6">Canada</option>
    <option value="7">China</option>
    <option value="8">Colombia</option>
    <option value="9">Costa Rica</option>
    <option value="10">Croatia</option>
    <option value="11">England</option>
    <option value="12">Fiji</option>
    <option value="13">Ireland</option>
    <option value="14">Japan</option>
    <option value="15">Malaysia</option>
    <option value="16">Mexico</option>
    <option value="17">Monaco</option>
    <option value="18">Morocco</option>
    <option value="19">Netherlands</option>
    <option value="20">New Zealand</option>
    <option value="21">Saudi Arabia</option>
    <option value="22">Seoul</option>
    <option value="23">Sint Maarten</option>
    <option value="24">Thailand</option>
    <option value="25">UAE</option>
    <option value="26">USA</option>
    <option value="27">Vietnam</option>
  </select>
  <br><br>
  Chain Name: <select name="chain_name" id="chain_name">
    <option value="1" selected="selected">Banyan Tree Hotels</option>
    <option value="2">Dracula Hotels</option>
    <option value="3">Fairmont Hotels & Resorts</option>
    <option value="4">Hyatt</option>
    <option value="5">Marriott</option>
  </select>
  <br><br>
    Rating: <input type="text" id = "rating" placeholder ="4.2">
   <br><br>
      Number of rooms: <input type="text" id = "num_of_rooms" placeholder ="75">
   <br><br>
    Price: <select name="chain_name" id="chain_name">
               <option value="1" selected="selected">197.90</option>
               <option value="2">205.00</option>
               <option value="3">210.50</option>
               <option value="4">270.50</option>
               <option value="5">311.50</option>
             </select>
             <br><br>
  Start of stay: <input type="date" value="date_start" id ="date_start">
  <br><br>
  End of stay: <input type="date" value="date_end" id = "date_end">
  <br><br>
  <input type="submit" value="Submit">
</form>
<h4>Notes:</h4>
<p>Rating: 1-5 with 1 decimal place.<br>Number of rooms: Min 20, Max 950</p>

<% if (rooms == null || rooms.size() == 0 ) { %>
                      <h2 style="margin-top: 5rem;">No Rooms found!</h2>
                        <% } else { %>
<table>
  <tr>
    <th>ID</th>
    <th>HotelID</th>
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
    <td><%= r.getId() %></td>
    <td><%= r.getHotelID() %></td>
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

