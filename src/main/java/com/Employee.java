package com;

public class Employee {

    private Integer SSN;
    private String first_name;
    private String last_name;
    private String address;

    /**
     * Constructor to create Employee object with SSN, first_name, last_name, address
     *
     * @param SSN           SSN of employee
     * @param first_name    first name of employee
     * @param last_name     last name of employee
     * @param address       address of employee
     */
    public Employee(Integer SSN, String first_name, String last_name, String address){
        this.SSN = SSN;
        this.first_name = first_name;
        this.last_name = last_name;
        this.address = address;
    }

    //Getters
    public Integer getSSN(){return this.SSN;}
    public String getFirst_name(){return this.first_name;}
    public String getLast_name(){return this.last_name;}
    public String getAddress(){return this.address;}

    //Setters
    public void setSSN(Integer SSN){this.SSN = SSN;}
    public void setFirst_name(String first_name){this.first_name = first_name;}
    public void setLast_name(String last_name){this.last_name = last_name;}
    public void setAddress(String address){this.address = address;}

    @Override
    public String toString() {
        return "<ul>"
                + "<li>Employee= " + SSN + "</li>"
                + "<li>Employee= " + first_name + "</li>"
                + "<li>Employee= " + last_name + "</li>"
                + "<li>Employee= " + address + "</li>";
    }
}
