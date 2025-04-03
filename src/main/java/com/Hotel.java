package com;

public class Hotel {

    private Integer id;
    private String chain_name;
    private String chain_address;
    private Integer num_of_rooms;
    private String email;
    private String address;
    private String area;
    private String phone;
    private float rating;

    /**
     * Constructor to create Hotel object with id, chain_name, chain_address, num_of_rooms, email, address,area, phone, rating
     *
     * @param id              id of hotel
     * @param chain_name      name of the hotel chain the hotel belongs to
     * @param chain_address   address of the hotel chain the hotel belongs to
     * @param num_of_rooms    number of rooms in the hotel
     * @param email           email of the hotel
     * @param address         address of the hotel
     * @param area            area of the hotel
     * @param phone           phone number of the hotel
     * @param rating          rating of the hotel, can only be 0 to 5
     */
    public Hotel(Integer id, String chain_name, String chain_address, Integer num_of_rooms, String email, String address, String area, String phone, float rating) throws Exception {
        this.id = id;
        this.chain_name = chain_name;
        this.chain_address = chain_address;
        this.num_of_rooms = num_of_rooms;
        this.email = email;
        this.address = address;
        this.area = area;
        this.phone = phone;
        if (rating < 0 || rating > 5){
            throw new Exception("Rating cannot be greater than 5 or less than 0");
        }
        else {
            this.rating = rating;
        }
    }

    //Getters
    public Integer getId(){return this.id;}
    public String getChain_name(){return this.chain_name;}
    public String getChain_address(){return this.chain_address;}
    public Integer getNum_of_rooms(){return this.num_of_rooms;}
    public String getEmail(){return this.email;}
    public String getAddress(){return this.address;}
    public String getArea(){return this.area;}
    public String getPhone(){return this.phone;}
    public float getRating(){return this.rating;}

    //Setters
    public void setId(Integer id){this.id = id;}
    public void setChain_name(String chain_name){this.chain_name = chain_name;}
    public void setChain_address(String chain_address){this.chain_address = chain_address;}
    public void setNum_of_rooms(Integer num_of_rooms){this.num_of_rooms = num_of_rooms;}
    public void setEmail(String email){this.email = email;}
    public void setAddress(String address){this.address = address;}
    public void setArea(String area){this.area = area;}
    public void setPhone(String phone){this.phone = phone;}
    public void setRating(float rating) throws Exception {
        if (rating < 0 || rating > 5){
            throw new Exception("Rating cannot be greater than 5 or less than 0");
        }
        else{
            this.rating = rating;
        }
    }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Hotel= " + id + "</li>"
                + "<li>Hotel= " + chain_name + "</li>"
                + "<li>Hotel= " + chain_address + "</li>"
                + "<li>Hotel= " + num_of_rooms + "</li>"
                + "<li>Hotel= " + email + "</li>"
                + "<li>Hotel= " + address + "</li>"
                + "<li>Hotel= " + area + "</li>"
                +"<li>Hotel= " + phone + "</li>"
                +"<li>Hotel= " + rating + "</li>";
    }
}
