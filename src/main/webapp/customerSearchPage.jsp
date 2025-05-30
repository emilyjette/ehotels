<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Customer Search Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
<jsp:include page="navbar.jsp"/>
<h2 style="background-color:MediumSeaGreen;color:White;text-align:center;">Search for a Room</h2>

<form name="form1" id="form1" action="searchResults.jsp" method="get">
  Capacity: <select name="capacity" id="capacity">
    <option value="1" selected="selected">1 person</option>
    <option value="2">2 people</option>
    <option value="3">3 people</option>
    <option value="4">4 people</option>
  </select>
  <br><br>
  Area: <select name="area" id="area">
    <option value=" Transylvania" selected="selected"> Transylvania</option>
    <option value="Australia">Australia</option>
    <option value="Austria">Austria</option>
    <option value="Barbados">Barbados</option>
    <option value="Botswana">Botswana</option>
    <option value="Canada">Canada</option>
    <option value="China">China</option>
    <option value="Colombia">Colombia</option>
    <option value="Costa Rica">Costa Rica</option>
    <option value="Croatia">Croatia</option>
    <option value="England">England</option>
    <option value="Fiji">Fiji</option>
    <option value="Ireland">Ireland</option>
    <option value="Japan">Japan</option>
    <option value="Malaysia">Malaysia</option>
    <option value="Mexico">Mexico</option>
    <option value="Monaco">Monaco</option>
    <option value="Morocco">Morocco</option>
    <option value="Netherlands">Netherlands</option>
    <option value="New Zealand">New Zealand</option>
    <option value="Saudi Arabia">Saudi Arabia</option>
    <option value="Seoul">Seoul</option>
    <option value="Sint Maarten">Sint Maarten</option>
    <option value="Thailand">Thailand</option>
    <option value="UAE">UAE</option>
    <option value="USA">USA</option>
    <option value="Vietnam">Vietnam</option>
  </select>
  <br><br>
  Chain Name: <select name="chain_name" id="chain_name">
    <option value="Banyan Tree Hotels" selected="selected">Banyan Tree Hotels</option>
    <option value="Dracula Hotels">Dracula Hotels</option>
    <option value="Fairmont Hotels & Resorts">Fairmont Hotels & Resorts</option>
    <option value="Hyatt">Hyatt</option>
    <option value="Marriott">Marriott</option>
  </select>
  <br><br>
    Rating: <input type="text" name="rating" id = "rating" placeholder ="4.2">
   <br><br>
      Number of rooms: <input type="text" name="num_of_rooms" id = "num_of_rooms" placeholder ="75">
   <br><br>
    Price: <select name="price" id="price">
               <option value="187.90" selected="selected">187.90</option>
               <option value="189.90" >189.90</option>
               <option value="197.90" >197.90</option>
               <option value="198.90" >198.90</option>
               <option value="205.00">205.00</option>
               <option value="207.00">207.00</option>
               <option value="207.99">207.99</option>
               <option value="210.50">210.50</option>
               <option value="212.15">212.15</option>
               <option value="212.55">212.55</option>
               <option value="213.55">213.55</option>
               <option value="215.50">215.50</option>
               <option value="270.50">270.50</option>
               <option value="279.50">279.50</option>
               <option value="283.50">283.50</option>
               <option value="288.50">288.50</option>
               <option value="289.50">289.50</option>
               <option value="311.50">311.50</option>
               <option value="314.20">314.20</option>
               <option value="315.20">315.20</option>
               <option value="324.20">324.20</option>
             </select>
             <br><br>
  Start of stay: <input type="date" name="date_start" value="date_start" id ="date_start">
  <br><br>
  End of stay: <input type="date" name="date_end" value="date_end" id = "date_end">
  <br><br>
  <input type="submit" value="Submit">
</form>

<h4>Notes:</h4>
<p>Rating: 1-5 with 1 decimal place.<br>Number of rooms: Min 20, Max 950</p>
</body>
</html>



