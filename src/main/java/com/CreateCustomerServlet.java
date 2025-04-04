package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/CreateCustomerServlet")
public class CreateCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customerName = request.getParameter("custName");
        String address = request.getParameter("address");

       int id = (int)(Math.random() * 101); // 0 to 100

        LocalDate date = LocalDate.now();
        Date sqlDateReg= Date.valueOf(date);

        CustomerService customerService = new CustomerService();

        try {
            Customer customer = new Customer(id,sqlDateReg,customerName,address);

            String resultMessage = customerService.createCustomer(customer);

            // Pass the result message to the JSP
            request.setAttribute("message", resultMessage);
            request.getRequestDispatcher("creationResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error creating booking: " + e.getMessage());
            request.getRequestDispatcher("creationResult.jsp").forward(request, response);
        }
    }

}

