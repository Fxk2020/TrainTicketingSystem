package com.fxk.entity;

public class User {

    private String user_name;
    private String user_password;
    private String name;
    private String IDNumber;//身份证号码

    private int stuStatus;//是否是学生

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

    public String getIDNumber() {
        return IDNumber;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public int getStuStatus() {
        return stuStatus;
    }

    public void setStuStatus(int stuStatus) {
        this.stuStatus = stuStatus;
    }
}
