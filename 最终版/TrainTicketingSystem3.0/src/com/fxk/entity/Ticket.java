package com.fxk.entity;

/**
 * 车票实体
 */

public class Ticket {

    int ticket_id;
    String train_id;
    String start_station_name;
    String end_station_name;
    int seat_grade;

    int carriage;
    String seat_location;
    String ride_time;
    String start_time;
    String end_time;

    double price;

    int user_id;//将order表和ticket表合并
    String orderTime;

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public Ticket() {
    }

    public Ticket(int ticket_id, String train_id, String start_station_name, String end_station_name, int seat_grade, String seat_location, String ride_time, String start_time, String end_time) {
        this.ticket_id = ticket_id;
        this.train_id = train_id;
        this.start_station_name = start_station_name;
        this.end_station_name = end_station_name;
        this.seat_grade = seat_grade;
        this.seat_location = seat_location;
        this.ride_time = ride_time;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public int getCarriage() {
        return carriage;
    }

    public void setCarriage(int carriage) {
        this.carriage = carriage;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public String getTrain_id() {
        return train_id;
    }

    public void setTrain_id(String train_id) {
        this.train_id = train_id;
    }

    public String getStart_station_name() {
        return start_station_name;
    }

    public void setStart_station_name(String start_station_name) {
        this.start_station_name = start_station_name;
    }

    public String getEnd_station_name() {
        return end_station_name;
    }

    public void setEnd_station_name(String end_station_name) {
        this.end_station_name = end_station_name;
    }

    public int getSeat_grade() {
        return seat_grade;
    }

    public void setSeat_grade(int seat_grade) {
        this.seat_grade = seat_grade;
    }

    public String getSeat_location() {
        return seat_location;
    }

    public void setSeat_location(String seat_location) {
        this.seat_location = seat_location;
    }

    public String getRide_time() {
        return ride_time;
    }

    public void setRide_time(String ride_time) {
        this.ride_time = ride_time;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
