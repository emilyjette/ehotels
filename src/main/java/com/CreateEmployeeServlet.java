package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CreateEmployeeServlet")
public class CreateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String SSN = request.getParameter("SSN");
        int intSSN = Integer.parseInt(SSN);
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String emplAddress = request.getParameter("emplAddress");

        EmployeeService employeeService = new EmployeeService();

        try {
            Employee employee = new Employee(intSSN,first_name,last_name,emplAddress);

            String resultMessage = employeeService.createEmployee(employee);

            // Pass the result message to the JSP
            request.setAttribute("message", resultMessage);
            request.getRequestDispatcher("changeCustomerResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error creating employee: " + e.getMessage());
            request.getRequestDispatcher("changeCustomerResult.jsp").forward(request, response);
        }
    }
}
