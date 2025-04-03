//@author Emily Jette
//student number: 300355657
package com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*
* calls to database
 */

public class RoomService {
    //Shows all rooms
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

    public List<Room> getSpecificRooms(Date date_start, Date date_end, int capacity, String area, String chain_name, Double rating, int num_of_rooms, Float price) throws Exception{
        Connection con = null;

        String sql = "SELECT R.* FROM ehotels.Hotel H JOIN Hotel_Room R ON H.id = R.hotelid LEFT JOIN renting as Rent on R.id = Rent.roomid and Rent.checkin_date BETWEEN ? AND ? WHERE R.capacity =? And H.area =? AND H.chain_name =? AND H.rating=? AND H.num_of_rooms=? AND R.price = ? AND Rent.roomid IS Null";
        ConnectionDB db = new ConnectionDB();
        List<Room> rooms = new ArrayList<>();

        try{
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setDate(1,date_start);
            stmt.setDate(2,date_end);
            stmt.setInt(3,capacity);
            stmt.setString(4,area);
            stmt.setString(5,chain_name);
            stmt.setDouble(6,rating);
            stmt.setInt(7,num_of_rooms);
            stmt.setFloat(8,price);

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

    /**
     * Method to create a room in the database
     *
     * @param room room to be created
     * @return string returned that states if the room created or not
     * @throws Exception when trying to connect to database
     */
    public String createRoom(Room room) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(room.getId());
        System.out.println(room.getHotelID());
        System.out.println(room.getPrice());
        System.out.println(room.getAmenities());
        System.out.println(room.getCapacity());
        System.out.println(room.getView());
        System.out.println(room.getDamages());
        System.out.println(room.getExtendable());

        String insertRoomQuery = "Insert into hotel_room (id,hotelid,price,amenities,capacity,view,damages,extendable) Values (?,?,?,?,?,?,?,?);";

        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomQuery);

            // set every ? of statement
            stmt.setInt(1, room.getId());
            stmt.setInt(2, room.getHotelID());
            stmt.setFloat(3, room.getPrice());
            stmt.setString(4,room.getAmenities());
            stmt.setInt(5,room.getCapacity());
            stmt.setString(6,room.getView());
            stmt.setString(7,room.getDamages());
            stmt.setString(8,room.getExtendable());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting room: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.isEmpty()) message = "Room successfully inserted!";

        }
        // return respective message
        return message;
    }

    /**
     * Method to update a room in the database
     * Cannot update the id or hotelID
     *
     * @param room room to be updated
     * @return string returned that states if the room updated or not
     * @throws Exception when trying to connect to database
     */
    public String updateRoom(Room room) throws Exception{
        Connection con = null;
        String message = "";

        String sql = "UPDATE room SET price=?, amenities=?, capacity=?,view=?,damages=?,extendable=? WHERE id=?;";
        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement

            // set every ? of statement
            stmt.setFloat(1, room.getPrice());
            stmt.setString(2,room.getAmenities());
            stmt.setInt(3,room.getCapacity());
            stmt.setString(4,room.getView());
            stmt.setString(5,room.getDamages());
            stmt.setString(6,room.getExtendable());
            stmt.setInt(7, room.getId());


            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            message = "Error while updating room: " + e.getMessage();

        } finally {
            if (con != null) con.close();
            if (message.isEmpty()) message = "Room successfully updated!";
        }

        return message;
    }

    public List<String> getAvgNumRooms()throws Exception{
        Connection con = null;
        String message = "";
        List<String> avg = new ArrayList<>();

        String sql = "Select Chain_name, avg(Num_of_rooms) as Avg_num_rooms From Hotel Group by Chain_name;";
        ConnectionDB db = new ConnectionDB();

        try{
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                String test = rs.getString("chain_name") +": "+ rs.getString("Avg_num_rooms");
                avg.add(test);

            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return avg;

        }catch  (Exception e) {
            throw new Exception(e.getMessage());
        }
    }


}
