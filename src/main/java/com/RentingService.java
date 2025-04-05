package com;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RentingService {
    public String createRenting(Renting renting) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();


        String insertRenting = "Insert into ehotels.renting (id,customerId,roomID,check_in_date,status) Values (?,?,?,?,?);";

        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRenting);

            // set every ? of statement
            stmt.setInt(1, renting.getId());
            stmt.setInt(2, renting.getCustomerId());
            stmt.setInt(3, renting.getRoomID());
            stmt.setDate(4,renting.get_check_in_date());
            stmt.setString(5,renting.getStatus());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting renting: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.isEmpty()) message = "renting successfully inserted!";

        }
        // return respective message
        return message;
    }
}
