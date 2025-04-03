package com;

import java.sql.Date;

public class Customer {

    private Integer id;
    private Date date_of_reg;
    private String name;
    private String address;

    /**
     * Constructor to create Customer object with id, date_of_reg, name, address
     *
     * @param id            id of customer
     * @param date_of_reg   date the customer registered
     * @param name          name of customer
     * @param address       address of customer
     */
    public Customer(Integer id, Date date_of_reg, String name, String address){
        this.id = id;
        this.date_of_reg = date_of_reg;
        this.name = name;
        this.address = address;
    }

    //Getters
    public Integer getId(){return this.id;}
    public Date getDate_of_reg(){return this.date_of_reg;}
    public String getName(){return this.name;}
    public String getAddress(){return this.address;}

    //Setters
    public void setId(Integer id){this.id = id;}
    public void setDate_of_reg(Date date_of_reg){this.date_of_reg = date_of_reg;}
    public void setName(String name){this.name = name;}
    public void setAddress(String address){this.address = address;}

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Customer= " + id + "</li>"
                + "<li>Customer= " + date_of_reg + "</li>"
                + "<li>Customer= " + name + "</li>"
                + "<li>Customer= " + address + "</li>";
    }
}
