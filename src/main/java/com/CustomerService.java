package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    public List<Customer> getAllCustomers() throws Exception{
        String sql = "SELECT * FROM ehotels.Customer";
        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Customer customer = new Customer(
                        rs.getInt("id"),
                        rs.getDate("date_of_reg"),
                        rs.getString("name"),
                        rs.getString("address")
                );
                customers.add(customer);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public Customer getSpecificCustomer(String name) throws Exception{
        String sql = "SELECT * FROM ehotels.Customer where name=?";
        ConnectionDB db = new ConnectionDB();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,name);
            ResultSet rs = stmt.executeQuery();
            Customer customer = null;
            if (rs.next()){
                 customer = new Customer(
                        rs.getInt("id"),
                        rs.getDate("date_of_reg"),
                        rs.getString("name"),
                        rs.getString("address")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customer;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    /*
     * @param id id of the customer to be deleted
     * @return string states if the customer was deleted or not
     * @return Exception when trying to connect to the db
     * */
    public String deleteCustomer(Integer id) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "DELETE FROM ehotels.Customer WHERE id = ?;";

        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,id);
            stmt.executeUpdate();
            stmt.close();

        }catch (Exception e){
            message = "Error while delete customer: " + e.getMessage();
        }finally {
            if (con != null) con.close();
            if (message.equals("")) message = "customer successfully deleted!";
        }
        return message;
    }

    /**
     * Method to create a customer in the database
     *
     * @param customer customer to be created
     * @return string returned that states if the customer created or not
     * @throws Exception when trying to connect to database
     */
    public String createCustomer(Customer customer) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(customer.getId());
        System.out.println(customer.getDate_of_reg());
        System.out.println(customer.getName());
        System.out.println(customer.getAddress());

        String insertRoomQuery = "Insert into ehotels.customer (id,date_of_reg,name,address) Values (?,?,?,?);";

        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomQuery);

            // set every ? of statement
            stmt.setInt(1, customer.getId());
            stmt.setDate(2, customer.getDate_of_reg());
            stmt.setString(3, customer.getName());
            stmt.setString(4,customer.getAddress());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting customer: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.isEmpty()) message = "customer successfully inserted!";

        }
        // return respective message
        return message;
    }

    /**
     * Method to update a customer in the database
     * Cannot update the id
     *
     * @param customer customer to be updated
     * @return string returned that states if the customer updated or not
     * @throws Exception when trying to connect to database
     */
    public String updateCustomer(Customer customer) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "UPDATE ehotels.customer SET date_of_reg=?, name=?, address=? WHERE id=?;";
        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setDate(1, customer.getDate_of_reg());
            stmt.setString(2,customer.getName());
            stmt.setString(3,customer.getAddress());
            stmt.setInt(4,customer.getId());


            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            message = "Error while updating customer: " + e.getMessage();

        } finally {
            if (con != null) con.close();
            if (message.isEmpty()) message = "customer successfully updated!";
        }

        return message;
    }
}
