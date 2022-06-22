package com.adc.nt.model;

import java.sql.Timestamp;

public class Dynamic {
    private int d_id;
    private int u_id;
    private String d_date;
    private String d_tag;
//    private String d_menu;
    private String d_details;
//    private String d_location;
    private String d_status;
    private String d_img;

    public String getD_img() {
        return d_img;
    }

    public void setD_img(String d_img) {
        this.d_img = d_img;
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getD_date() {
        return d_date;
    }

    public void setD_date(String d_date) {
        this.d_date = d_date;
    }

    public String getD_tag() {
        return d_tag;
    }

    public void setD_tag(String d_tag) {
        this.d_tag = d_tag;
    }

    /*public String getD_menu() {
        return d_menu;
    }

    public void setD_menu(String d_menu) {
        this.d_menu = d_menu;
    }*/

    public String getD_details() {
        return d_details;
    }

    public void setD_details(String d_details) {
        this.d_details = d_details;
    }

  /*  public String getD_location() {
        return d_location;
    }

    public void setD_location(String d_location) {
        this.d_location = d_location;
    }*/

    public String getD_status() {
        return d_status;
    }

    public void setD_status(String d_status) {
        this.d_status = d_status;
    }
}
