package com.fxk.entity;

/**
 * 前端需给后端传输的位置信息
 */
public class Location {

    int carriage;
    String location;

    public int getCarriage() {
        return carriage;
    }

    public void setCarriage(int carriage) {
        this.carriage = carriage;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
