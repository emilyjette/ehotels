package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String ID = request.getParameter("ID");
    int intID = Integer.parseInt(ID);

    HotelService hotelService = new HotelService();

    try {

        String resultMessage = hotelService.deleteHotel(intID);

        // Pass the result message to the JSP
        request.setAttribute("message", resultMessage);
        request.getRequestDispatcher("changeHotelResult.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("message", "Error deleting hotel: " + e.getMessage());
        request.getRequestDispatcher("changeHotelResult.jsp").forward(request, response);
    }
}

}
