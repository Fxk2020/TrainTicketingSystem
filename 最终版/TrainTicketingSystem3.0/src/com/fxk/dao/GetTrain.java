package com.fxk.dao;

import com.fxk.entity.Train;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * 通过始发站和终点站确定火车
 */
public class GetTrain {

    public static ArrayList<Train> getTrains(String startCity,String endCity){

        ArrayList<Train> list = new ArrayList<>();
/*
           mysql中并没有intersect和except的语句，获取经过起始城市和终止城市的火车id
           同时要确定起始站一定在终止站的前方（防止"倒车的bug"）-2020.9.24
 */
        String sql = "select distinct train_id from Train_message natural join Train_station natural join Stop_table as T where " +
                "city='"+startCity+"' and train_id in (select train_id from Train_message natural join Train_station natural join Stop_table where" +
                " city='"+endCity+"') and (select max(mileage) from Train_message natural join Train_station natural join Stop_table where" +
                " city='"+startCity+"' and train_id=T.train_id) < (select max(mileage) from Train_message natural join Train_station natural join Stop_table where city='"+endCity+"' and train_id=T.train_id)  and status=1";



        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try{
            while (resultSet.next()){

                System.out.println("火车号为："+resultSet.getString(1));
                String train_id = resultSet.getString(1);

                Train train = new Train();
                train.setTrainType(train_id);
                train.setStartStation(getStation(startCity,train_id));
                train.setEndStation(getStation(endCity,train_id));

                train.setSeat1(getSeat(train_id,1));
                train.setSeat2(getSeat(train_id,2));
                train.setSeat3(getSeat(train_id,3));

                System.out.println("火车的始发站是："+getStation(startCity,train_id));

                list.add(train);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    /*
    判断车票是否售完
     */
    private static String getSeat(String train_id, int i) {

        String train_type = switch (i) {
            case 1 -> "一等座";
            case 2 -> "二等座";
            default -> "三等座";
        };

        String sql = "select * from Train_seat where train_id='"+train_id+"' and seat_type='"+train_type+"' and occupy=1";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String result = "";

        try {
            if (resultSet.next()){
                result = "有余票";
            }else {
                result = "已售完";
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return result;

    }

    /*
    寻找火车起始站点
     */
    public static String getStation(String startCity, String train_id){

        String sql = "select station_name from Train_message natural join Train_station natural join Stop_table where train_id='"+train_id+"' and city='"+startCity+"'";

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        String station = "";

        try{
            while (resultSet.next()){

                station = resultSet.getString(1);

                return station;//获取第一个查到的火车站

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

System.out.println("第一个火车站是："+station);

        return station;

    }

    /*
    获取火车号和剩余座位的方法
     */
//    public static Train getInformation(String train_id){
//        String sql = "select distinct train_id ,a_remaining_seats,b_remaining_seats,c_remaining_seats from Train_message natural join Train_station natural join Stop_table   where train_id='"+train_id+"'";
//
//        ResultSet resultSet = JDBCTest.executeQuery(sql);
//
//        Train train = null;
//
//        try{
//            while (resultSet.next()){
//
//                String trainType = resultSet.getString(1);
//                int seat1 = resultSet.getInt(2);
//                int seat2 = resultSet.getInt(3);
//                int seat3 = resultSet.getInt(4);
//
//                train = new Train(trainType,seat1,seat2,seat3);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//        return train;
//
//    }




}
