package com;

import java.sql.Date;

public class Renting {
    private Integer id;
    private Integer customerId;
    private Integer roomID;
    private Date check_in_date;
    private String status;

    public Renting(Integer id, Integer customerId, Integer roomID, Date check_in_date, String status){
        this.id = id;
        this.customerId = customerId;
        this.roomID = roomID;
        this.check_in_date = check_in_date;
        this.status = status;

    }
    public Integer getId(){return this.id;}
    public Integer getCustomerId(){return this.customerId;}
    public Date get_check_in_date(){return this.check_in_date;}
    public Integer getRoomID(){return this.roomID;}
    public String getStatus(){return this.status;}
}
