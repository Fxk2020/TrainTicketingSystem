package com.fxk.entity;

/**
 * 记录换乘的信息 两个火车id，三个站点名称，四个时间
 */

public class TransferMessage {

    String start_station_name;
    String end_station_name;
    String transfer_station_name;

    String a_train_id;
    String b_train_id;

    String a_start_time;
    String a_end_time;
    String b_start_time;
    String b_end_time;

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

    public String getTransfer_station_name() {
        return transfer_station_name;
    }

    public void setTransfer_station_name(String transfer_station_name) {
        this.transfer_station_name = transfer_station_name;
    }

    public String getA_train_id() {
        return a_train_id;
    }

    public void setA_train_id(String a_train_id) {
        this.a_train_id = a_train_id;
    }

    public String getB_train_id() {
        return b_train_id;
    }

    public void setB_train_id(String b_train_id) {
        this.b_train_id = b_train_id;
    }

    public String getA_start_time() {
        return a_start_time;
    }

    public void setA_start_time(String a_start_time) {
        this.a_start_time = a_start_time;
    }

    public String getA_end_time() {
        return a_end_time;
    }

    public void setA_end_time(String a_end_time) {
        this.a_end_time = a_end_time;
    }

    public String getB_start_time() {
        return b_start_time;
    }

    public void setB_start_time(String b_start_time) {
        this.b_start_time = b_start_time;
    }

    public String getB_end_time() {
        return b_end_time;
    }

    public void setB_end_time(String b_end_time) {
        this.b_end_time = b_end_time;
    }
}
