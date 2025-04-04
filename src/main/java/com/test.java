package com;

import java.sql.*;
import java.util.List;

//directly from pgadmin

public class test {

    public static List<Room> allRooms() throws Exception {
        RoomService test = new RoomService();
        List<Room> rooms;
        try{
            rooms = test.getAllRooms();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
       return rooms;
    }

    public static List<Room> specificRooms() throws Exception {
        RoomService test = new RoomService();
        List<Room> rooms;
        try{
            Date sqlStartDate = Date.valueOf("2021-03-12");
            Date sqlEndDate = Date.valueOf("2021-03-24");

            rooms = test.getSpecificRooms(sqlStartDate,sqlEndDate,2," Transylvania","Dracula Hotels",4.2,300,(float)205.00);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
        return rooms;
    }

    public static List<String> avgNumRooms() throws Exception{
        RoomService test = new RoomService();
        List<String> avg;
        try{
            //really just checking for capacity and price
            avg = test.getAvgNumRooms();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
        return avg;
    }

    public static List<Customer> getCustomer() throws Exception{
        CustomerService test = new CustomerService();
        List<Customer> customers;
        try {
             customers = test.getAllCustomers();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
        return customers;
    }
    public static Customer getSpecificCustomer() throws Exception{
        CustomerService test = new CustomerService();
        Customer customers;
        try {
            customers = test.getSpecificCustomer("Taylor Swift");
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
        return customers;
    }


    public static void main(String[] args) {
        // JDBC URL, username, and password of MySQL server

      try {

         Customer test = getSpecificCustomer();
         System.out.println(test);
         System.out.println(test.getId());
//          if(test.isEmpty()){
//             System.out.println("No customer found");
//          }
//          for (Customer customer : test) {
//              System.out.println(customer);
//          }
      }catch (Exception e){
          System.out.println(e.getMessage());
      }

/*
      try{
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5433/postgres",
                    "postgres", "admin");

            Statement st = db.createStatement();
            st.execute("SET search_path TO ehotels;");
/*
            System.out.println("query 1");
            ResultSet rs1 = st.executeQuery("SELECT HR.ID, H.Chain_name as HotelName, H.Address as HotelAddress FROM Hotel_room as HR JOIN Hotel as H ON HR.HotelID = H.ID  Order by HR.Price");
            System.out.println("roomId \t hotel name \t hotel address");
            while (rs1.next()){
                System.out.println(rs1.getString(1)+"\t"+ rs1.getString(2)+"\t"+rs1.getString(3));
            }

            System.out.println("\nquery 2");
            ResultSet rs2 = st.executeQuery("SELECT Chain_name, avg(Num_of_rooms) as Avg_num_rooms  FROM hotel Group by Chain_name");
            System.out.println("chain name \t average num of rooms");
            while(rs2.next()){
                System.out.println(rs2.getString(1) +"\t" + rs2.getString(2));
            }

            System.out.println("\nquery 3");
            ResultSet rs3 = st.executeQuery("Select ID as Customer_Id, Name as Customer_Name, (Select Address From Hotel Where Hotel.ID = (Select HotelID  From Hotel_Room Where Hotel_Room.ID = ( Select RoomID From Renting Where Renting.CustomerID = Customer.ID  AND Renting.Status = 'Checked-In')) ) as Hotel_Address From Customer  Where ID IN( Select CustomerID  From Renting  Where RoomID IN( Select ID  From Hotel_room Where HotelID IN( Select ID  From Hotel ) )AND Status = 'Checked-In' )Group by Customer_ID");
            System.out.println("Customer Id \t Customer Name \t Hotel Address");
            while(rs3.next()){
                System.out.println(rs3.getString(1) +"\t" + rs3.getString(2)+"\t"+rs3.getString(3));
            }

            System.out.println("\nquery 4");
            ResultSet rs4 = st.executeQuery("Select E.First_name, H.Chain_name as HotelName, H.Address as HotelAddress From Works_At as W Join Hotel as H on W.HotelID = H.ID Join Employee as E on W.SSN = E.SSN");
            System.out.println("Employee name \t Hotel name \t Hotel address");
            while(rs4.next()){
                System.out.println(rs4.getString(1) +"\t" + rs4.getString(2)+"\t"+rs4.getString(3));
            }

            rs1.close();
            rs2.close();
            rs3.close();
            rs4.close();

            System.out.println("query ");
            ResultSet rs = st.executeQuery("Select * from Customer");
            System.out.println("id \t date of reg \t name \t address");
            while(rs.next()){
                System.out.println( rs.getInt(1)+"\t"+rs.getDate(2)+"\t"+rs.getString(3)+"\t"+ rs.getString(4));
            }
            st.close();
            db.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }*/
    }

}
