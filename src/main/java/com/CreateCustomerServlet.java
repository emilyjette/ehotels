package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/CreateCustomerServlet")

public class CreateCustomerServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID = request.getParameter("custID");
        int intCustID = Integer.parseInt(ID);
        String date = request.getParameter("date_of_reg");
        Date date_of_reg = Date.valueOf(date);
        String name = request.getParameter("custName");
        String address = request.getParameter("custAddress");

        CustomerService customerService = new CustomerService();

        try {
            Customer customer = new Customer(intCustID,date_of_reg,name,address);

            String resultMessage = customerService.createCustomer(customer);

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
