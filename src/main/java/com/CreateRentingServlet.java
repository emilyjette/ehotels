package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;


public class CreateRentingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int custID = Integer.parseInt(request.getParameter("cust_id"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        Date check_in_date = Date.valueOf(request.getParameter("date_start"));
        int ID = Integer.parseInt(request.getParameter("rent_ID"));


        RentingService rentingService = new RentingService();

        try {
            Renting renting = new Renting(ID,custID,roomID,check_in_date,"Checked in");

            String resultMessage = rentingService.createRenting(renting);

            // Pass the result message to the JSP
            request.setAttribute("message", resultMessage);
            request.getRequestDispatcher("changeCustomerResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error creating customer: " + e.getMessage());
            request.getRequestDispatcher("changeCustomerResult.jsp").forward(request, response);
        }
    }
















}
