package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateHotelServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID = request.getParameter("ID");
        int intID = Integer.parseInt(ID);
        String chain_name = request.getParameter("chain_name");
        String chain_address = request.getParameter("chain_address");
        String num_of_rooms = request.getParameter("num_of_rooms");
        int intNumRooms = Integer.parseInt(num_of_rooms);
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String area = request.getParameter("area");
        String phone = request.getParameter("phone");
        String rating = request.getParameter("rating");
        float floatRating = Float.parseFloat(rating);

        HotelService hotelService = new HotelService();

        try {
            Hotel hotel = new Hotel(intID,chain_name, chain_address,intNumRooms,email,address,area,phone,floatRating);

            String resultMessage = hotelService.update(hotel);

            // Pass the result message to the JSP
            request.setAttribute("message", resultMessage);
            request.getRequestDispatcher("changeHotelResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating hotel: " + e.getMessage());
            request.getRequestDispatcher("changeHotelResult.jsp").forward(request, response);
        }
    }
}
