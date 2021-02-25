package com.fxk.dao;

import com.fxk.entity.Stop_train;
import com.fxk.entity.Train_stopTable;
import com.fxk.util.JDBCTest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GetAllTrain {
    /**
     * 获取所有未停运的火车
     * @return
     */
    public  static ArrayList<Train_stopTable> getTrain_stopTable(){

        String sql = "select train_id,arrive_time,stop_time,mileage,station_name from Train_message natural join Stop_table natural join Train_station where status=1";

        ArrayList<Train_stopTable> train_stopTables = new ArrayList<>();

        ResultSet resultSet = JDBCTest.executeQuery(sql);

        try{
            while (resultSet.next()){
                Train_stopTable temp = new Train_stopTable();

                String train_id = resultSet.getString(1);
                String arrive_time = resultSet.getString(2);
                String stop_time = resultSet.getString(3);
                int mileage = resultSet.getInt(4);
                String station_name = resultSet.getString(5);

                temp.setTrain_id(train_id);
                temp.setArrive_time(arrive_time);
                temp.setStop_time(stop_time);
                temp.setMileage(mileage);
                temp.setStation_name(station_name);

                train_stopTables.add(temp);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return train_stopTables;

    }

    /**
     * 获取所有停运的火车
     * @return
     */
    public static ArrayList<Stop_train> getStop_train() {

        String sql = "select * from Train_message where status=0";

        ResultSet resultSet = JDBCTest.executeQuery(sql);
        ArrayList<Stop_train> stop_trains = new ArrayList<>();

        try{
            while (resultSet.next()){
                String train_id = resultSet.getString(1);
                String train_type = resultSet.getString(2);

                Stop_train temp = new Stop_train();
                temp.setTrain_id(train_id);
                temp.setTrain_type(train_type);
                stop_trains.add(temp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return stop_trains;

    }
}
