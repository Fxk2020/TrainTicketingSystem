package com.fxk.entity;

public class User {

    private int user_id;
    private String user_name;
    private String user_password;
    private String name;
    private String IDNumber;
    private boolean stuStatus;

    public String getIDNumber() {
        return IDNumber;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public boolean isStuStatus() {
        return stuStatus;
    }

    public void setStuStatus(boolean stuStatus) {
        this.stuStatus = stuStatus;
    }
}
