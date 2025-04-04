package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String roomId = request.getParameter("roomId");
            String date_start = request.getParameter("date_start");
            String customerName = request.getParameter("custName");

            int intRoomId = Integer.parseInt(roomId);
            Date sqlDateStart = Date.valueOf(date_start);

            RoomService roomService = new RoomService();

            try {
                int customerId = getCustomerIdByName(customerName);

                String resultMessage = roomService.bookRoom(sqlDateStart, intRoomId, customerId);

                // Pass the result message to the JSP
                request.setAttribute("message", resultMessage);
                request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error creating booking: " + e.getMessage());
                request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
            }
        }

        private int getCustomerIdByName(String customerName) throws Exception{
            CustomerService test = new CustomerService();
            Customer customer;
            try {
                customer = test.getSpecificCustomer("Taylor Swift");
            }catch (Exception e){
                throw new Exception(e.getMessage());
            }
            return customer.getId();
        }
    }

