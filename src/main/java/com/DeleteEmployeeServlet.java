package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String SSN = request.getParameter("SSN");
        int intSSN = Integer.parseInt(SSN);

        EmployeeService employeeService = new EmployeeService();

        try {

            String resultMessage = employeeService.deleteEmployee(intSSN);

            // Pass the result message to the JSP
            request.setAttribute("message", resultMessage);
            request.getRequestDispatcher("changeEmployeeResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error deleting employee: " + e.getMessage());
            request.getRequestDispatcher("changeEmployeeResult.jsp").forward(request, response);
        }
    }
}
