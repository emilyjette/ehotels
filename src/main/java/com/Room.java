package com;

public class Room {

    private Integer id;
    private Integer hotelID;
    private float price;
    private String amenities;
    private int capacity;
    private String view;
    private String damages;
    private String expendable;


    /**
     * Constructor to create Grade object with id, course_name, grade, student_id
     *
     * @param id        id of room
     * @param hotelID   if of the hotel
     * @param price     price of room
     * @param amenities room amenities
     * @param capacity  room capacity
     * @param view      room view
     * @param damages   room damages
     */
    public Room(Integer id, Integer hotelID, float price, String amenities, int capacity, String view, String damages,String expendable) {
        this.id = id;
        this.hotelID = hotelID;
        this.price = price;
        this.amenities = amenities;
        this.capacity = capacity;
        this.view = view;
        this.damages = damages;
        this.expendable = expendable;
    }

    //Getters
    public Integer getId(){return this.id;}
    public Integer getHotelID(){return this.hotelID;}
    public float getPrice(){return this.price;}
    public String getAmenities(){return this.amenities;}
    public int getCapacity(){return this.capacity;}
    public String getView(){return this.view;}
    public String getDamages(){return this.damages;}
    public String getExpendable(){return this.expendable;}

    //Setters

    public void setId(Integer id){this.id = id;}
    public void setHotelID(Integer hotelID){this.hotelID = hotelID;}
    public void setPrice(float price){this.price=price;}
    public void setAmenities(String amenities){this.amenities=amenities;}
    public void setCapacity(int capacity){this.capacity=capacity;}
    public void setView(String view){this.view=view;}
    public void setDamages(String damages){this.damages=damages;}
    public void setExpendable(String expendable){this.expendable=expendable;}

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Room= " + id + "</li>"
                + "<li>Room= " + hotelID + "</li>"
                + "<li>Room= " + price + "</li>"
                + "<li>Room= " + amenities + "</li>"
                + "<li>Room= " + capacity + "</li>"
                + "<li>Room= " + view + "</li>"
                + "<li>Room= " + damages + "</li>"
                +"<li>Room= " + expendable + "</li>";
    }
}