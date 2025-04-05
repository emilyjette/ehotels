package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {
    public List<Hotel> getAllService() throws Exception{
        String sql = "SELECT * FROM Hotel";
        ConnectionDB db = new ConnectionDB();

        List<Hotel> hotels = new ArrayList<>();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Hotel hotel = new Hotel(
                        rs.getInt("id"),
                        rs.getString("chain_name"),
                        rs.getString("chain_address"),
                        rs.getInt("num_of_rooms"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("area"),
                        rs.getString("phone"),
                        rs.getFloat("rating")
                );
                hotels.add(hotel);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotels;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    /*
     * @param id id of the hotel to be deleted
     * @return string states if the hotel was deleted or not
     * @return Exception when trying to connect to the db
     * */
    public String deleteHotel(Integer id) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "DELETE FROM Hotel WHERE id = ?;";

        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,id);
            stmt.executeUpdate();
            stmt.close();

        }catch (Exception e){
            message = "Error while delete hotel: " + e.getMessage();
        }finally {
            if (con != null) con.close();
            if (message.equals("")) message = "hotel successfully deleted!";
        }
        return message;
    }

    /**
     * Method to create a hotel in the database
     *
     * @param hotel hotel to be created
     * @return string returned that states if the hotel created or not
     * @throws Exception when trying to connect to database
     */
    public String createHotel(Hotel hotel) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(hotel.getId());
        System.out.println(hotel.getChain_name());
        System.out.println(hotel.getChain_address());
        System.out.println(hotel.getNum_of_rooms());
        System.out.println(hotel.getEmail());
        System.out.println(hotel.getAddress());
        System.out.println(hotel.getArea());
        System.out.println(hotel.getPhone());
        System.out.println(hotel.getRating());

        String insertRoomQuery = "Insert into hotel_room (id,chain_name,chain_address,num_of_rooms,email,address,area,phone,rating) Values (?,?,?,?,?,?,?,?,?);";

        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomQuery);

            // set every ? of statement
            stmt.setInt(1, hotel.getId());
            stmt.setString(2,hotel.getChain_name());
            stmt.setString(3, hotel.getChain_address());
            stmt.setInt(4,hotel.getNum_of_rooms());
            stmt.setString(5,hotel.getEmail());
            stmt.setString(6,hotel.getAddress());
            stmt.setString(7,hotel.getArea());
            stmt.setString(8,hotel.getPhone());
            stmt.setFloat(9,hotel.getRating());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting hotel: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.isEmpty()) message = "hotel successfully inserted!";

        }
        // return respective message
        return message;
    }

    /**
     * Method to update a hotel in the database
     * Cannot update the id or chain_name or chain_address
     *
     * @param hotel hotel to be updated
     * @return string returned that states if the hotel updated or not
     * @throws Exception when trying to connect to database
     */
    public String update(Hotel hotel) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "UPDATE hotel SET num_of_rooms=?,email=?,address=?,area=?,phone=?,rating=? WHERE id=?;";
        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1,hotel.getNum_of_rooms());
            stmt.setString(2,hotel.getEmail());
            stmt.setString(3,hotel.getAddress());
            stmt.setString(4,hotel.getArea());
            stmt.setString(5,hotel.getPhone());
            stmt.setFloat(6,hotel.getRating());
            stmt.setInt(7,hotel.getId());
            stmt.setString(8,hotel.getChain_name());
            stmt.setString(9,hotel.getChain_address());

            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            message = "Error while updating hotel: " + e.getMessage();

        } finally {
            if (con != null) con.close();
            if (message.isEmpty()) message = "hotel successfully updated!";
        }

        return message;
    }
}
