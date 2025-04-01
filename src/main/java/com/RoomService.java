//@author Emily Jette
//student number: 300355657
package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//calls to db

public class RoomService {
    public List<Room> getAllRooms() throws Exception{
        String sql = "SELECT * FROM Hotel_Room";
        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Room room = new Room(
                        rs.getInt("id"),
                        rs.getInt("hotelid"),
                        rs.getFloat("price"),
                        rs.getString("amenities"),
                        rs.getInt("capacity"),
                        rs.getString("view"),
                        rs.getString("damages"),
                        rs.getString("extendable")
                );
                rooms.add(room);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rooms;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public List<Room> getSpecificRooms(int capacity, String area, String chain_name,Float rating, int num_of_rooms, Float price) throws Exception{
        Connection con = null;
        //easy ones
        String sql = "SELECT * FROM Hotel_Room Where capacity =? and price =? ";
        //chain name,rating, num_of_rooms,area must come from hotel
        //Join??
        //"Select chain_name, rating,num_of_rooms,area from Hotel Where ID = hotelID"

        // capacity, area, chain,rating,num of rooms available in hotel, price
        ConnectionDB db = new ConnectionDB();
        List<Room> rooms = new ArrayList<>();

        try{
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,capacity);
            stmt.setFloat(2,price);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Room room = new Room(
                        rs.getInt("id"),
                        rs.getInt("hotelid"),
                        rs.getFloat("price"),
                        rs.getString("amenities"),
                        rs.getInt("capacity"),
                        rs.getString("view"),
                        rs.getString("damages"),
                        rs.getString("extendable")
                );
                rooms.add(room);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rooms;

        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    /*
    * @param id id of the room to be deleted
    * @return string states if the grade was deleted or not
    * @return Exception when trying to connect to the db
    * */
    public String deleteRoom(Integer id) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "DELETE FROM Hotel_Room WHERE id = ?;";

        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,id);
            stmt.executeUpdate();
            stmt.close();

        }catch (Exception e){
            message = "Error while delete room: " + e.getMessage();
        }finally {
            if (con != null) con.close();
            if (message.equals("")) message = "room successfully deleted!";
        }
        return message;
    }

}
