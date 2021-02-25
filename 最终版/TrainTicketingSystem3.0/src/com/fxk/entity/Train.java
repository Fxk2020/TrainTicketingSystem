package com.fxk.entity;

public class Train {
    String trainType;

    String startStation;
    String endStation;

    String seat1;
    String seat2;
    String seat3;

    String hour;

    public Train() {
    }

    public Train(String trainType, String startStation, String endStation, String hour) {
        this.trainType = trainType;
        this.startStation = startStation;
        this.endStation = endStation;
        this.hour = hour;
    }

    public Train(String trainType) {
        this.trainType = trainType;
    }


    public String getTrainType() {
        return trainType;
    }

    public void setTrainType(String trainType) {
        this.trainType = trainType;
    }

    public String getStartStation(){return startStation;}

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getEndStation() {
        return endStation;
    }

    public void setEndStation(String endStation) {
        this.endStation = endStation;
    }

    public String getSeat1() {
        return seat1;
    }

    public void setSeat1(String seat1) {
        this.seat1 = seat1;
    }

    public String getSeat2() {
        return seat2;
    }

    public void setSeat2(String seat2) {
        this.seat2 = seat2;
    }

    public String getSeat3() {
        return seat3;
    }

    public void setSeat3(String seat3) {
        this.seat3 = seat3;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }
}
