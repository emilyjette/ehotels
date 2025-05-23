//@author Emily Jette
//student number: 300355657
package com;


import java.sql.*;

public class ConnectionDB {

    // Database connection settings, change dbName, dbusername, dbpassword
    private Connection con = null;
    //I had to change it to 5433 instead of default 5432 bc it was breaking on my computer, this way should work for everyone
    private final String dbServerPort = "5433";
    private final String dbName = "postgres";
    private final String dbusername = "postgres";
    private final String dbpassword = "admin";

    public Connection getConnection() throws Exception{
        try{
            Class.forName("org.postgresql.Driver");

            con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/postgres",dbusername,dbpassword);

            return con;

        }catch (Exception e){
            throw new Exception("Could not establish connection with the Database Server: "
                    + e.getMessage());
        }
    }

    public void close() throws SQLException{
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new SQLException("Could not close connection with the Database Server: "
                    + e.getMessage());
        }
    }

}








