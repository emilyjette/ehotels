package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeService {
    public List<Employee> getAllEmployees() throws Exception{
        String sql = "SELECT * FROM Employee";
        ConnectionDB db = new ConnectionDB();

        List<Employee> employees = new ArrayList<>();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Employee employee = new Employee(
                        rs.getInt("SSN"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address")
                );
                employees.add(employee);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employees;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    /*
     * @param SSN   SSN of the employee to be deleted
     * @return string states if the employee was deleted or not
     * @return Exception when trying to connect to the db
     * */
    public String deleteEmployee(Integer SSN) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "DELETE FROM Employee WHERE SSN = ?;";

        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,SSN);
            stmt.executeUpdate();
            stmt.close();

        }catch (Exception e){
            message = "Error while delete employee: " + e.getMessage();
        }finally {
            if (con != null) con.close();
            if (message.equals("")) message = "employee successfully deleted!";
        }
        return message;
    }

    /**
     * Method to create an employee in the database
     *
     * @param employee employee to be created
     * @return string returned that states if the customer created or not
     * @throws Exception when trying to connect to database
     */
    public String createEmployee(Employee employee) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(employee.getSSN());
        System.out.println(employee.getFirst_name());
        System.out.println(employee.getLast_name());
        System.out.println(employee.getAddress());

        String insertRoomQuery = "Insert into employee (SSN,first_name,last_name,address) Values (?,?,?,?);";

        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomQuery);

            // set every ? of statement
            stmt.setInt(1, employee.getSSN());
            stmt.setString(2, employee.getFirst_name());
            stmt.setString(3, employee.getLast_name());
            stmt.setString(4,employee.getAddress());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting employee: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.isEmpty()) message = "employee successfully inserted!";

        }
        // return respective message
        return message;
    }

    /**
     * Method to update an employee in the database
     * Cannot update the SSN
     *
     * @param employee employee to be updated
     * @return string returned that states if the employee updated or not
     * @throws Exception when trying to connect to database
     */
    public String updateEmployee(Employee employee) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "UPDATE employee SET first_name=?, last_name=?, address=? WHERE SSN=?;";
        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setString(1, employee.getFirst_name());
            stmt.setString(2,employee.getLast_name());
            stmt.setString(3,employee.getAddress());
            stmt.setInt(4, employee.getSSN());


            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            message = "Error while updating employee: " + e.getMessage();

        } finally {
            if (con != null) con.close();
            if (message.isEmpty()) message = "employee successfully updated!";
        }

        return message;
    }
}
